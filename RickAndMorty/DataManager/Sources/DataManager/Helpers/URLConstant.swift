//
//  URLConstant.swift
//  DataManager
//
//  Created by Roman on 22/02/2025.
//

import Foundation

enum URLConstant {
    
    static let baseURL = "https://rickandmortyapi.com/api/character"
    
    case allCharacters
    case search(name: String)
    case detailOfCharacter(id: Int)
}

extension URLConstant {
    var url: String {
        switch self {
        case .allCharacters:
            return URLConstant.baseURL
        case .search(let name):
            return "\(URLConstant.baseURL)/?name=\(name)"
        case .detailOfCharacter(let id):
            return "\(URLConstant.baseURL)/\(id)"
        }
    }
}
