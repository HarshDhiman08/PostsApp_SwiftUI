//
//  PostsApp.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

@main
struct PostsApp: App {
    @StateObject private var favorites = FavoritesManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favorites)
        }
    }
}
