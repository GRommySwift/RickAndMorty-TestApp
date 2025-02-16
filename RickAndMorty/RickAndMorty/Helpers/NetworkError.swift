//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid url"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server"
        case .invalidData:
            return "Invalid data"
        }
    }
}
