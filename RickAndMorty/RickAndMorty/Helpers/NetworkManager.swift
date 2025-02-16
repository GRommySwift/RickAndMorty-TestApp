//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
