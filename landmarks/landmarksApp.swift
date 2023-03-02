//
//  landmarksApp.swift
//  landmarks
//
//  Created by Johnny Luo on 1/3/2023.
//

import SwiftUI

@main
struct landmarksApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
