//
//  Time_to_IftarApp.swift
//  Time to Iftar
//
//  Created by Iman Morshed on 1/27/25.
//

import SwiftUI

@main
struct Time_to_IftarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
