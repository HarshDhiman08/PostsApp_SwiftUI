//
//  ContentView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PostsListView()
                .tabItem {
                    Label("Posts", systemImage: "list.bullet")
                }

            FavoritesListView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
}

