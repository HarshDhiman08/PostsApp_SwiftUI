//
//  Post.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import Foundation

struct Post: Identifiable, Hashable, Decodable {
    let id: Int           
    let title: String
    let body: String
    let userId: Int

    static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
