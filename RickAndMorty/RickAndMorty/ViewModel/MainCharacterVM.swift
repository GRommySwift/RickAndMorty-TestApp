//
//  MainCharacterVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import Observation

@Observable
@MainActor
class MainCharacterVM {
    var characters: [Result] = []
    var isLoading = false
    
    private var nextPage: String? = nil
    
    func fetchCharacters() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await NetworkManager.shared.fetchData(from: nextPage ?? URLConstant.allCharacters.url, as: CharacterResponse.self)
            characters = response.results
            nextPage = response.info.next
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

