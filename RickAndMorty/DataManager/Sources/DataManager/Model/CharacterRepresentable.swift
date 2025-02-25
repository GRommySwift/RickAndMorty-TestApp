//
//  CharacterRepresentable.swift
//  DataManager
//
//  Created by Roman on 22/02/2025.
//

import Foundation

public protocol CharacterRepresentable {
    var id: Int { get }
    var name: String { get }
    var status: String { get }
    var species: String { get }
    var type: String { get }
    var gender: String { get }
    var originName: String { get }
    var locationName: String { get }
    var image: String? { get }
}

