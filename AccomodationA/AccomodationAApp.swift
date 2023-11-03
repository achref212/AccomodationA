//
//  AccomodationAApp.swift
//  AccomodationA
//
//  Created by chaabani achref on 3/11/2023.
//

import SwiftUI

@main
struct AccomodationAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
