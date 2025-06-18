//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/07.
//

import SwiftUI

@main
struct FirstAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
