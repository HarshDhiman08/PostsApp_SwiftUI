//
//  FavoritesListView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favorites: FavoritesManager
    @StateObject private var vm = PostsViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading && vm.posts.isEmpty {
                    ProgressView("Loading posts...")
                } else if let error = vm.errorMessage, vm.posts.isEmpty {
                    VStack(spacing: 12) {
                        Text("Unable to load posts")
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Button("Retry") {
                            Task { await vm.fetchPosts() }
                        }
                    }
                } else {
                    List(favoritePosts) { post in
                        NavigationLink(value: post) {
                            PostRowView(post: post)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable { await vm.fetchPosts() }
                }
            }
            .navigationTitle("Favorites")
            .task { if vm.posts.isEmpty { await vm.fetchPosts() } }
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post)
            }
        }
    }

    private var favoritePosts: [Post] {
        vm.posts.filter { favorites.favoriteIDs.contains($0.id) }
    }
}
#Preview {
    FavoritesListView()
        .environmentObject(FavoritesManager())
}
