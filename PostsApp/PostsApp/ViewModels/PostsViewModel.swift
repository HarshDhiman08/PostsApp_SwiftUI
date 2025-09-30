//
//  PostsViewModel.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import Foundation
import Combine

@MainActor
final class PostsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var allPosts: [Post] = []

    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetched = try await NetworkService.shared.fetchPosts()
            self.allPosts = fetched
            applyFilter()
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func applyFilter() {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            posts = allPosts
        } else {
            let q = searchText.lowercased()
            posts = allPosts.filter { $0.title.lowercased().contains(q) }
        }
    }
}
