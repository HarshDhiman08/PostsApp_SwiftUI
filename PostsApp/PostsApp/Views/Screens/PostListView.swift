//
//  PostListView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var vm = PostsViewModel()
    @EnvironmentObject var favorites: FavoritesManager

    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading && vm.posts.isEmpty {
                    ProgressView("Loading posts...")
                } else if let error = vm.errorMessage, vm.posts.isEmpty {
                    VStack(spacing: 12) {
                        Text("Failed to load posts")
                        Text(error).font(.caption).foregroundColor(.secondary)
                        Button("Retry") { Task { await vm.fetchPosts() } }
                            .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(vm.posts) { post in
                        NavigationLink(value: post) {
                            PostRowView(post: post)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable { await vm.fetchPosts() }
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    SearchBarView(text: $vm.searchText, onTextChanged: vm.applyFilter)
                        .frame(maxWidth: 520)
                }
            }
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post)
            }
            .task {
                if vm.posts.isEmpty { await vm.fetchPosts() }
            }
        }
    }
}
#Preview {
    PostsListView()
        .environmentObject(FavoritesManager())
}
