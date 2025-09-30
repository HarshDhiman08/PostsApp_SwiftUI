//
//  NetworkService.swift
//  PostsApp
//
//  Created by Harsh Dhiman on 30/09/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case badResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .badResponse: return "Bad response from server"
        case .decodingError: return "Failed to decode response"
        }
    }
}

final class NetworkService {
    static let shared = NetworkService()
    private init() {}

    private let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func fetchPosts() async throws -> [Post] {
        let (data, response) = try await URLSession.shared.data(from: postsURL)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw NetworkError.badResponse
        }
        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return posts
        } catch {
            throw NetworkError.decodingError
        }
    }
}
