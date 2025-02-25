// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@MainActor
public class DataManager {
    
    private let networkManager: NetworkManager
    
    public init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    public func fetchBasicCharacters() async -> ([Result], String?) {
        do {
            let response = try await networkManager.fetchData(from: URLConstant.allCharacters.url, as: CharacterResponse.self)
            return (response.results, response.info.next)
        } catch let error as NetworkError {
            print(error)
            return ([], nil)
        } catch {
            print("Unexpected error: \(error)")
            return ([], nil)
        }
    }
    
    public func searchCharacters(name: String) async -> ([Result], String?) {
        guard !name.isEmpty else { return ([], nil)}
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let modifiedString = trimmedString.lowercased()
        let url = URLConstant.search(name: modifiedString).url
        
        do {
            let response = try await networkManager.fetchData(from: url, as: CharacterResponse.self)
            return (response.results, response.info.next)
        } catch let error as NetworkError {
            print(error)
            return ([], nil)
        } catch {
            print("Unexpected error: \(error)")
            return ([], nil)
        }
    }
    
    public func mainViewLoadNextPage(_ nextPage: String) async -> ([Result], String?) {
        do {
            let response = try await networkManager.fetchData(from: nextPage, as: CharacterResponse.self)
            return (response.results, response.info.next)
        } catch let error as NetworkError {
            print(error)
            return ([], nil)
        } catch {
            print("Unexpected error: \(error)")
            return ([], nil)
        }
    }
    
    public func searchViewLoadNextPage(_ nextFilteredPage: String) async -> ([Result], String?) {
        do {
            let response = try await networkManager.fetchData(from: nextFilteredPage, as: CharacterResponse.self)
            return (response.results, response.info.next)
        } catch let error as NetworkError {
            print(error)
            return ([], nil)
        } catch {
            print("Unexpected error: \(error)")
            return ([], nil)
        }
    }
    
    public func fetchDetailOfCharacter(id: Int) async -> [Result] {
        do {
            let response = try await networkManager.fetchData(from: URLConstant.detailOfCharacter(id: id).url, as: Result.self)
            return [response]
        } catch let error as NetworkError {
            print(error)
            return []
        } catch {
            print("Unexpected error: \(error)")
            return []
        }
    }
}
