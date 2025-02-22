//
//  DetailViewVM.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//


import SwiftUI
import Observation
import DataManager

@Observable
@MainActor
class DetailViewVM {
    let datamanager: DataManager = DataManager()
    var character: [Result] = []
    
    func fetchCharacter(id: Int) async {
        character = await datamanager.fetchDetailOfCharacter(id: id)
    }
}
