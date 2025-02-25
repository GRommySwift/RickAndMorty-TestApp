//
//  ListViewConstants.swift
//  RickAndMorty
//
//  Created by Roman on 23/02/2025.
//
import SwiftUI

enum ListViewConstants {
    
    static let hStackSpacing: CGFloat = 3
    static let vStackSpacing: CGFloat = 2
    static let objectsPadding: CGFloat = 10
    static let searchViewPadding: CGFloat = 0
    static let widthOfImage: CGFloat = 44
    static let widthOfFrame: CGFloat = 44
    static let vStackFrameWidth: CGFloat = 150
    static let favoriteIconXOffset: CGFloat = -5
    static let imageFrameSize: CGFloat = 16
    static let iconPadding: CGFloat = 8
    static let backgroundCornerRadius: CGFloat = 16
    static var listScreenWidth: CGFloat {
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            return UIScreen.main.bounds.width - 40
        } else {
            if UIScreen.main.bounds.width > 700 {
                return UIScreen.main.bounds.width - 160
            } else {
                return UIScreen.main.bounds.width - 80
            }
        }
    }
}
