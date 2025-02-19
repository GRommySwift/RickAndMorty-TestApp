//
//  ListOfCharacters.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI

struct ListOfCharacters: View {
    let character: Result
    let isSearch: Bool
    var body: some View {
        HStack(spacing: UIConstants.hStackSpacing) {
            ImageLoader(widthOfImage: UIConstants.widthOfImage, character: character)
                .frame(width: UIConstants.widthOfFrame)
                .padding(UIConstants.objectsPadding)
            VStack(alignment: .leading, spacing: UIConstants.vStackSpacing) {
                Text(character.name)
                    .foregroundStyle(.foregroundsPrimary)
                    .multilineTextAlignment(.leading)
                    .font(.headLine3)
                Text(character.status)
                    .foregroundStyle(.foregroundsSecondary)
                    .font(.paragraphSmall)
            }
            .padding(.top, UIConstants.objectsPadding)
            .padding(.bottom, UIConstants.objectsPadding)
            .frame(width: UIConstants.vStackFrameWidth, alignment: .leading)
            Spacer()
            if !isSearch {
                Image("arrow_right")
                    .renderingMode(.template)
                    .foregroundStyle(.iconsSecondary)
                    .padding(.trailing, UIConstants.objectsPadding)
                    .scaledToFit()
                    .frame(width: UIConstants.imageFrameSize, height: UIConstants.imageFrameSize)
                    .padding(.trailing, UIConstants.iconPadding)
            }
        }
        .frame(minWidth: UIConstants.listScreenWidth, maxWidth: UIConstants.listScreenWidth)
        .background(.backgroundsTertiary.opacity(isSearch ? 0 : 1)).cornerRadius(UIConstants.backgroundCornerRadius)
        .padding(.bottom, isSearch ? UIConstants.searchViewPadding : UIConstants.objectsPadding)
    }
}
