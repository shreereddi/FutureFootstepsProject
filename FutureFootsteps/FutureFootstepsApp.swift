//
//  FutureFootstepsApp.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(name: "")
                .modelContainer(for: ToDoItem.self)
        }
    }
}
