//
//  PostDetailView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    @EnvironmentObject var favorites: FavoritesManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(post.title)
                            .font(.title)
                            .bold()
                        Text("User ID: \(post.userId)")
                            .font(.subheadline)
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

                Text(post.body)
                    .font(.body)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    NavigationStack {
        PostDetailView(
            post: Post(
                id: 1,
                title: "Sample Post Title",
                body: "This is a sample body for previewing the post detail view. It can span multiple lines to simulate real content.",
                userId: 1
            )
        )
    }
    .environmentObject(FavoritesManager())
}
