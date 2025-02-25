//
//  TabItems.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

enum TabItems: Int, CaseIterable {
    
    case main = 0
    case favorite
    
    var icon: Image {
        switch self {
        case .main:
            return Image(.tabCharacters)
        case .favorite:
            return Image(.tabStar)
        }
    }
}
