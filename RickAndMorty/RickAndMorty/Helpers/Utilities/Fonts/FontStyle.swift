//
//  FontStyle.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

enum FontStyle {
    case headLine1
    case headLine2
    case headLine3
    case paragraphLarge
    case paragraphMedium
    case paragraphSmall
    case bottomNavigation
    
    var font: Font {
        switch self {
        case .headLine1:
            FontStyle.inter(style: .bold, size: 28)
        case .headLine2:
            FontStyle.inter(style: .bold, size: 20)
        case .headLine3:
            FontStyle.inter(style: .bold, size: 16)
        case .paragraphLarge:
            FontStyle.inter(style: .regular, size: 18)
        case .paragraphMedium:
            FontStyle.inter(style: .regular, size: 16)
        case .paragraphSmall:
            FontStyle.inter(style: .regular, size: 14)
        case .bottomNavigation:
            FontStyle.inter(style: .regular, size: 12)
        }
    }
    
    private static func inter(style: InterStyle, size: CGFloat, weight: Font.Weight? = nil) -> Font {
        Font.custom(style.rawValue, size: size)
    }
}

extension Font {
    static let headLine1 = FontStyle.headLine1.font
    static let headLine2 = FontStyle.headLine2.font
    static let headLine3 = FontStyle.headLine3.font
    static let paragraphLarge = FontStyle.paragraphLarge.font
    static let paragraphMedium = FontStyle.paragraphMedium.font
    static let paragraphSmall = FontStyle.paragraphSmall.font
    static let bottomNavigation = FontStyle.bottomNavigation.font
}


