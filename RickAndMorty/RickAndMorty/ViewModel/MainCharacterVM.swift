//
//  MainCharacterVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import DataManager
import Observation

@Observable
@MainActor
class MainCharacterVM {
    
    private let dataManager: DataManager = DataManager()
    var characters: [Result] = []
    var sortedCharacters: [Result] = []
    
    private var nextPage: String? = nil
    private var nextFilteredPage: String? = nil
    
    func cleanSortedCharacters() {
        sortedCharacters = []
    }
    
    func fetchCharacters(type: TypeOfFetch, name: String? = nil) async {
        switch type {
        case .mainViewCharacters:
             (characters, nextPage) = await dataManager.fetchBasicCharacters()
        case .searchViewCharacters:
            (sortedCharacters, nextFilteredPage) = await dataManager.searchCharacters(name: name ?? "")
        case .mainViewLoadMore:
            await loadMore(type: .mainView)
        case .searchViewLoadMore:
            await loadMore(type: .searchView)
        }
    }
 
    private func loadMore(type: typeOfLoadMore) async {
        switch type {
        case .mainView:
            guard let nextPage = nextPage else { return }
            let (characters, next) = await dataManager.mainViewLoadMore(nextPage: nextPage)
            self.characters.append(contentsOf: characters)
            self.nextPage = next
        case .searchView:
            guard let nextFilteredPage = nextFilteredPage else { return }
            let (characters, next) = await dataManager.mainViewLoadMore(nextPage: nextFilteredPage)
            self.characters.append(contentsOf: characters)
            self.nextPage = next
        }
    }
}

extension MainCharacterVM {
    enum typeOfLoadMore {
        case mainView
        case searchView
    }
}
