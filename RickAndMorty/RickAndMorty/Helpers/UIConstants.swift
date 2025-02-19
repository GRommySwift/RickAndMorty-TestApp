//
//  UIConstants.swift
//  RickAndMorty
//
//  Created by Roman on 18/02/2025.
//

import SwiftUI

struct UIConstants {
    
    //MARK: - Detail view
    
    static let cardPadding: CGFloat = 10
    static let cardMaxWidth: CGFloat = 360
    static let cardCornerRadius: CGFloat = 16
    static let cardShadowRadius: CGFloat = 4

    static let headerHeight: CGFloat = 160
    static let imageWidth: CGFloat = 140
    static let textWidth: CGFloat = 100
    static let imagePadding : CGFloat = 10
    static let textXOffset: CGFloat = 10
    static let nameYOffset: CGFloat = -35
    static let valueYOffset: CGFloat = -20

    static let favoriteIconSize: CGFloat = 32
    static let favoriteIconXOffset: CGFloat = -5
    static let favoriteIconYOffset: CGFloat = 5

    static let gridColumns: [GridItem] = [
        GridItem(.fixed(80), alignment: .leading),
        GridItem(.flexible(), alignment: .leading)
    ]
    static let gridVerticalSpacing: CGFloat = 24
    static let detailsPaddingLeading: CGFloat = 24
    static let detailsPaddingVertical: CGFloat = 23
    
    //MARK: - List of characters
    
    static let hStackSpacing: CGFloat = 3
    static let vStackSpacing: CGFloat = 2
    static let objectsPadding: CGFloat = 10
    static let searchViewPadding: CGFloat = 0
    
    static let widthOfImage: CGFloat = 44
    static let widthOfFrame: CGFloat = 44
    
    static let vStackFrameWidth: CGFloat = 150
    
    static let imageFrameSize: CGFloat = 16
    static let iconPadding: CGFloat = 8
    
    static let backgroundCornerRadius: CGFloat = 16
    
    static let listScreenWidth = UIScreen.main.bounds.width - 40
}
