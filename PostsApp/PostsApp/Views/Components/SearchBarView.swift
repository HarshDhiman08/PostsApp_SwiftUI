//
//  SearchBarView.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var onTextChanged: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
            TextField("Search by title...", text: $text)
                .textFieldStyle(.roundedBorder)
                .onChange(of: text) { onTextChanged?() }

            if !text.isEmpty {
                Button(action: { text = ""; onTextChanged?() }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.glass)
            }
        }
        .padding(8)
        .background(.background, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var text = ""
    var body: some View {
        SearchBarView(text: $text)
            .padding()
    }
}
