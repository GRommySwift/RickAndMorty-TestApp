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
struct Result: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String
}
