//
//  NotesApp.swift
//  Notes
//
//  Created by Consultant on 7/26/23.
//

import SwiftUI

@main
struct NotesApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
