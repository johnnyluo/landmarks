//
//  ModelData.swift
//  landmarksUITests
//
//  Created by Johnny Luo on 1/3/2023.
//

import Foundation

final class ModelData: ObservableObject{
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var categories: [String:[Landmark]] {
        Dictionary(
            grouping: landmarks,by: {$0.category.rawValue})
    }
    var features:[Landmark]{
        get{
            return landmarks.filter{l in
                l.isFeatured
            }
        }
    }
}


func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
