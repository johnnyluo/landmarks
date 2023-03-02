//
//  FavoriateButton.swift
//  landmarks
//
//  Created by Johnny Luo on 2/3/2023.
//

import SwiftUI

struct FavoriateButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favoriate",systemImage: isSet ?  "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriateButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriateButton(isSet: .constant(true))
    }
}
