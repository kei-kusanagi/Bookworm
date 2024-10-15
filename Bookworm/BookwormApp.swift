//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Juan Carlos Robledo Morales on 14/10/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
