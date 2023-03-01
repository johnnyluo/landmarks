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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
