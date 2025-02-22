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
        HStack(spacing: UIConstants.hStackSpacing) {
            ImageLoader(widthOfImage: UIConstants.widthOfImage, character: character)
                .frame(width: UIConstants.widthOfFrame)
                .padding(UIConstants.objectsPadding)
            VStack(alignment: .leading, spacing: UIConstants.vStackSpacing) {
                HStack {
                    Text(character.name)
                        .foregroundStyle(.foregroundsPrimary)
                        .multilineTextAlignment(.leading)
                        .font(.headLine3)
                    Image("favorites_active")
                        .resizable()
                        .frame(width: UIConstants.imageFrameSize, height: UIConstants.imageFrameSize)
                        .padding(.leading, UIConstants.favoriteIconXOffset)
                        .opacity(isFavorite ? 1 : 0)
                }
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

//#Preview {
//    ListOfCharacters(character: Result(id: 1, name: "asdas asdas", status: "asdasd", species: "Asdasd", type: "asdasd", gender: "asdasd", origin: Location(name: "some"), location: Location(name: "where"), image: "AppIcon"), isSearch: false)
//}
