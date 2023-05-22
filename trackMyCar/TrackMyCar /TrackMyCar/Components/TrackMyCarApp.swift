//
//  TrackMyCarApp.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 11.04.2023.
//

import SwiftUI

@main
struct TrackMyCarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
