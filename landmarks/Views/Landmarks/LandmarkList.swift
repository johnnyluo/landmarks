//
//  LandmarkList.swift
//  landmarks
//
//  Created by Johnny Luo on 1/3/2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriatesOnly = false
    var filteredLandmarks :[Landmark] {
        modelData.landmarks.filter { l in
            (!showFavoriatesOnly || l.isFavorite)
        }
    }
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoriatesOnly){
                    Text("Favoriate only")
                }
                ForEach(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
