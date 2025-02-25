//
//  DataManagerTests.swift
//  RickAndMortyTests
//
//  Created by Roman on 23/02/2025.
//

import Testing
@testable import DataManager


@MainActor
struct DataManagerTests {
    let dataManager: DataManager = DataManager()
    let mockCharacter = CharacterResponse(info: Info(next: "https://rickandmortyapi.com/api/character?page=2"),
                                          results: [Result(id: 1,
                                                           name: "Rick Sanchez",
                                                           status: "Alive",
                                                           species: "Human",
                                                           type: "",
                                                           gender: "Male",
                                                           origin: Location(name: "Earth (C-137)"),
                                                           location: Location(name: "Citadel of Ricks"),
                                                           image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                                                    Result(id: 21,
                                                           name: "Ants in my Eyes Johnson",
                                                           status: "unknown",
                                                           species: "Human",
                                                           type: "Human with ants in his eyes",
                                                           gender: "Male",
                                                           origin: Location(name: "unknown"),
                                                           location: Location(name: "Interdimensional Cable"),
                                                           image: "https://rickandmortyapi.com/api/character/avatar/21.jpeg"),
                                                    Result(id: 218,
                                                           name: "Mechanical Rick",
                                                           status: "unknown",
                                                           species: "Robot",
                                                           type: "",
                                                           gender: "Male",
                                                           origin: Location(name: "Earth (Replacement Dimension)"),
                                                           location: Location(name: "Earth (Replacement Dimension)"),
                                                           image: "https://rickandmortyapi.com/api/character/avatar/218.jpeg")
                                          ])
    let mockNextSearchPage = "https://rickandmortyapi.com/api/character/?page=2&name=rick"
    
    @Test("Test of fetching characters for main view")
    func fetchBasicCharacters() async throws {
        let (response, next) = await dataManager.fetchBasicCharacters()
        guard let firstURL = next, let secondURL = mockCharacter.info.next else { return }
        
        #expect(response.first?.id == mockCharacter.results.first?.id && firstURL == secondURL)
    }
    
    @Test("Testing of search method")
    func searchCharacter() async throws {
        let mockName = "Rick"
        let (response, next) = await dataManager.searchCharacters(name: mockName)
        guard let next = next else { return }
        #expect(response.first?.id == mockCharacter.results.first?.id && next == mockNextSearchPage)
    }
    
    @Test("Testing paging of main view")
    func mainViewLoadNextPage() async throws {
        guard let nextPage = mockCharacter.info.next else { return }
        let response = await dataManager.mainViewLoadNextPage(nextPage)
        
        #expect(response.0.first?.id == mockCharacter.results[1].id)
    }
    
    @Test("Testing paging of search view")
    func searchViewLoadNextPage() async throws {
        let response = await dataManager.searchViewLoadNextPage(mockNextSearchPage)
        
        #expect(response.0.first?.id == mockCharacter.results[2].id)
    }
    
    @Test("Test loading data of detail view")
    func fetchDetailViewCharacter() async throws {
        let response = await dataManager.fetchDetailOfCharacter(id: 1)
        
        #expect(response.first?.name == mockCharacter.results.first?.name)
    }
}
