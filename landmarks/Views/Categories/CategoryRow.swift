//
//  CategoryRow.swift
//  landmarks
//
//  Created by Johnny Luo on 2/3/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(items) { landmark in
                        NavigationLink{
                            LandmarkDetail(landmark:landmark)
                        } label:{
                            CategoryItem(landmark:landmark)
                        }
                        
                    }
                }
            }.frame(height: 185)
            
        }
    }
}


struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(categoryName: "Test", items: Array(landmarks.prefix(3)))
    }
}
