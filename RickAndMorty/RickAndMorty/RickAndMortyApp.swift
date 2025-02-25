//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI
import SwiftData

@main
struct RickAndMortyApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(FavoriteViewVM(modelContext: container.mainContext))
                .modelContainer(container)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: CharacterFavorite.self)
        } catch {
            fatalError("Failed to create ModelContainer for CharacterFavorite.")
        }
    }
}
