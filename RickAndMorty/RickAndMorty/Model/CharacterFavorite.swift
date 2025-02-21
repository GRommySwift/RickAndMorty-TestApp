//
//  FavoriteModel.swift
//  RickAndMorty
//
//  Created by Roman on 20/02/2025.
//

import SwiftData

@Model
class CharacterFavorite: CharacterRepresentable {
    @Attribute(.unique) var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: String
    var location: String
    var image: String?

    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: String, location: String, image: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
    }
}

extension CharacterFavorite {
    var originName: String { origin }
    var locationName: String { location }
}
