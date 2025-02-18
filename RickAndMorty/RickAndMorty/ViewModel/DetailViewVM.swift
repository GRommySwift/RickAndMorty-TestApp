//
//  DetailViewVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//


import SwiftUI
import Observation

@Observable
@MainActor
class DetailViewVM {
    var character: [Result] = []
    
    func fetchCharacter(id: Int) async {
        do {
            
            let response = try await NetworkManager.shared.fetchData(from: URLConstant.detailOfCharacter(id: id).url, as: Result.self)
            character = [response]
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}
