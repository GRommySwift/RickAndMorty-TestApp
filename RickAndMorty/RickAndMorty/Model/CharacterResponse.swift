//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let next: String
}

// MARK: - Result
struct Result: Codable, Equatable, CharacterRepresentable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name, status, species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String
}

extension Result {
    var originName: String { origin.name }
    var locationName: String { location.name }
}
