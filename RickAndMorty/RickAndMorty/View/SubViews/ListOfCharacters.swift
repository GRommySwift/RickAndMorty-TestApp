//
//  ListOfCharacters.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import SwiftData
import DataManager

struct ListOfCharacters<T: CharacterRepresentable>: View {
    
    @EnvironmentObject var viewModel: FavoriteViewVM
    @Query private var favorites: [CharacterFavorite]
    let character: T
    let isSearch: Bool
    
    private var isFavorite: Bool {
        favorites.contains { $0.id == character.id }
    }
    
    var body: some View {
        HStack(spacing: ListViewConstants.hStackSpacing) {
            ImageLoader(widthOfImage: ListViewConstants.widthOfImage, character: character)
                .frame(width: ListViewConstants.widthOfFrame)
                .padding(ListViewConstants.objectsPadding)
            VStack(alignment: .leading, spacing: ListViewConstants.vStackSpacing) {
                HStack {
                    Text(character.name)
                        .foregroundStyle(.foregroundsPrimary)
                        .multilineTextAlignment(.leading)
                        .font(.headLine3)
                    Image("favorites_active")
                        .resizable()
                        .frame(width: ListViewConstants.imageFrameSize, height: ListViewConstants.imageFrameSize)
                        .padding(.leading, ListViewConstants.favoriteIconXOffset)
                        .opacity(isFavorite ? 1 : 0)
                }
                Text(character.status)
                    .foregroundStyle(.foregroundsSecondary)
                    .font(.paragraphSmall)
            }
            .padding(.top, ListViewConstants.objectsPadding)
            .padding(.bottom, ListViewConstants.objectsPadding)
            .frame(width: ListViewConstants.vStackFrameWidth, alignment: .leading)
            Spacer()
            if !isSearch {
                Image("arrow_right")
                    .renderingMode(.template)
                    .foregroundStyle(.iconsSecondary)
                    .padding(.trailing, ListViewConstants.objectsPadding)
                    .scaledToFit()
                    .frame(width: ListViewConstants.imageFrameSize, height: ListViewConstants.imageFrameSize)
                    .padding(.trailing, ListViewConstants.iconPadding)
            }
        }
        .frame(minWidth: ListViewConstants.listScreenWidth, maxWidth: ListViewConstants.listScreenWidth)
        .background(.backgroundsTertiary.opacity(isSearch ? 0 : 1)).cornerRadius(ListViewConstants.backgroundCornerRadius)
        .padding(.bottom, isSearch ? ListViewConstants.searchViewPadding : ListViewConstants.objectsPadding)
        
    }
}
