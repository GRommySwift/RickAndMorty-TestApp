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
    var sortedCharacters: [Result] = []
    var isLoading = false
    
    private var nextPage: String? = nil
    
    func cleanSortedCharacters() {
        sortedCharacters = []
    }
    
    func fetchCharacters() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await NetworkManager.shared.fetchData(from: URLConstant.allCharacters.url, as: CharacterResponse.self)
            characters = response.results
            nextPage = response.info.next
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
    
    func searchCharacters(name: String) async {
        guard !name.isEmpty else { return }
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let modifiedString = trimmedString.lowercased()
        let url = URLConstant.search(name: modifiedString).url
        
        do {
            let response = try await NetworkManager.shared.fetchData(from: url, as: CharacterResponse.self)
            sortedCharacters = response.results
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

