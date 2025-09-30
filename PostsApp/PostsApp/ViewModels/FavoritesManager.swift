
//
//  FavoritesManager.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import Foundation
import Combine

@MainActor
final class FavoritesManager: ObservableObject {
    @Published private(set) var favoriteIDs: Set<Int> = []

    private let key = "favoritePostIDs_v1"

    init() {
        load()
    }

    func toggle(_ post: Post) {
        if favoriteIDs.contains(post.id) {
            favoriteIDs.remove(post.id)
        } else {
            favoriteIDs.insert(post.id)
        }
        save()
    }

    func contains(_ post: Post) -> Bool {
        favoriteIDs.contains(post.id)
    }

    private func save() {
        let array = Array(favoriteIDs)
        UserDefaults.standard.set(array, forKey: key)
    }

    private func load() {
        if let arr = UserDefaults.standard.array(forKey: key) as? [Int] {
            favoriteIDs = Set(arr)
        }
    }
}

