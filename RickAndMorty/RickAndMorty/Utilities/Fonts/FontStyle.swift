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
}

extension Font {
    
    private static func inter(style: InterStyle, size: CGFloat) -> Font {
        Font.custom(style.rawValue, size: size)
    }
    
    fileprivate static func custom(_ fontType: FontStyle) -> Font {
        return switch fontType {
        case .headLine1: inter(style: .bold, size: 28)
        case .headLine2: inter(style: .bold, size: 20)
        case .headLine3: inter(style: .bold, size: 16)
        case .paragraphLarge: inter(style: .regular, size: 18)
        case .paragraphMedium: inter(style: .regular, size: 16)
        case .paragraphSmall: inter(style: .regular, size: 14)
        case .bottomNavigation: inter(style: .regular, size: 12)
        }
    }
}

extension View {
    func font(style: FontStyle) -> some View {
        self.font(Font.custom(style))
    }
}
