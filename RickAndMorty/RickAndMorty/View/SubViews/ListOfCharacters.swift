//
//  ListOfCharacters.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI

struct ListOfCharacters: View {
    let character: Result
    var body: some View {
        HStack(spacing: 3) {
            ImageLoader(widthOfImage: 44, character: character)
                .frame(width: 44)
                .padding(10)
            VStack(alignment: .leading, spacing: 2) {
                Text(character.name)
                    .foregroundStyle(.foregroundsPrimary)
                    .font(.headLine3)
                Text(character.status)
                    .foregroundStyle(.foregroundsSecondary)
                    .font(.paragraphSmall)
            }
            .padding(.top, 10)
            .padding(.bottom, 11)
            .frame(width: 150, alignment: .leading)
            Spacer()
            Image("arrow_right")
                .renderingMode(.template)
                .foregroundStyle(.iconsSecondary)
                .padding(.trailing, 10)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(.trailing, 8)
        }
        .frame(minWidth: UIScreen.main.bounds.width - 40, maxWidth: UIScreen.main.bounds.width - 40)
        .background(.backgroundsTertiary).cornerRadius(16)
        .padding(.bottom, 10)
    }
}
