//
//  FavoriteViewVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftData
import SwiftUI

@MainActor
class FavoriteViewVM: ObservableObject {
    
    var modelContext: ModelContext?
    
    @Published var favorites: [CharacterFavorite]?
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
        fetchFavorites()
    }
    
    func fetchFavorites() {
        do {
            let descriptor = FetchDescriptor<CharacterFavorite>()
            favorites = try modelContext?.fetch(descriptor)
        } catch {
            print("Ошибка при загрузке избранного: \(error)")
        }
    }
    
    func isFavorite(characterID: Int) -> Bool {
        return ((favorites?.contains { $0.id == characterID }) != nil)
    }
    
    func toggleFavorite(_ character: Result) {
        if let existing = favorites?.first(where: { $0.id == character.id }) {
            modelContext?.delete(existing)
        } else {
            let newFavorite = CharacterFavorite(
                id: character.id,
                name: character.name,
                status: character.status,
                species: character.species,
                type: character.type,
                gender: character.gender,
                origin: character.origin.name,
                location: character.location.name,
                image: character.image
            )
            modelContext?.insert(newFavorite)
        }
        
        fetchFavorites()
    }
}



