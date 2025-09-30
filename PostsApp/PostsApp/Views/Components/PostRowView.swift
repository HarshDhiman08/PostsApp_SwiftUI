//
//  PostRowView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    @EnvironmentObject var favorites: FavoritesManager

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                Text("User ID: \(post.userId)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                favorites.toggle(post)
            } label: {
                Image(systemName: favorites.contains(post) ? "heart.fill" : "heart")
                    .imageScale(.large)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
    }
}
