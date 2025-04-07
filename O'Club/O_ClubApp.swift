//
//  O_ClubApp.swift
//  O'Club
//
//  Created by 최효원 on 4/7/25.
//

import SwiftUI

@main
struct O_ClubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
