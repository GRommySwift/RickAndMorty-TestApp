//
//  MainCharacterVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import Observation

@MainActor
class MainCharacterVM: ObservableObject {
    @Published var characters: [Result] = []
    var sortedCharacters: [Result] = []
    
    var nextPage: String? = nil
    var nextFilteredPage: String? = nil
    
    func cleanSortedCharacters() {
        sortedCharacters = []
    }
    
    func fetchCharacters() async {
        do {
            let response = try await NetworkManager.shared.fetchData(from: URLConstant.allCharacters.url, as: CharacterResponse.self)
            self.characters = response.results
            self.nextPage = response.info.next
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
    
    func fetchNextPageCharacters(isItSearch: Bool) async {
        guard let nextPage = nextPage else { return }
        guard let nextFilteredPage = nextFilteredPage else { return }
        do {
            if isItSearch {
                let response = try await NetworkManager.shared.fetchData(from: nextFilteredPage, as: CharacterResponse.self)
                self.sortedCharacters.append(contentsOf: response.results)
                self.nextFilteredPage = response.info.next
            } else {
                let response = try await NetworkManager.shared.fetchData(from: nextPage, as: CharacterResponse.self)
                self.characters.append(contentsOf: response.results)
                self.nextPage = response.info.next
            }
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
            self.sortedCharacters = response.results
            self.nextFilteredPage = response.info.next
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

