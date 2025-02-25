//
//  CharacterResponse.swift
//  DataManager
//
//  Created by Roman on 22/02/2025.
//

import Foundation

// MARK: - CharacterResponse
public struct CharacterResponse: Codable, Sendable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let next: String?
}

// MARK: - Result
public struct Result: Codable, Equatable, CharacterRepresentable, Sendable {
    public static func == (lhs: Result, rhs: Result) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id: Int
    public let name, status, species: String
    public let type: String
    public let gender: String
    public let origin, location: Location
    public let image: String?
}

// MARK: - Location
public struct Location: Codable, Sendable {
    public let name: String
}

extension Result {
    public var originName: String { origin.name }
    public var locationName: String { location.name }
}

