//
//  FavoritesView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI
import SwiftData

struct FavoriteCharacterView: View {
    
    @Query(sort: \CharacterFavorite.id) var favoriteUsersDB: [CharacterFavorite]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundsPrimary.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    if favoriteUsersDB.isEmpty {
                        Text("No favorites yet")
                            .font(.paragraphLarge)
                            .foregroundStyle(.foregroundsTertiary)
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.top, UIScreen.main.bounds.height / 2.5)
                    } else {
                        ForEach(favoriteUsersDB, id: \.id) { character in
                            NavigationLink(
                                destination: DetailView(backButtonTitle: "Favorites", idOfCharacter: character.id)
                            ) {
                                ListOfCharacters(character: character, isSearch: false)
                            }
                        }
                    }
                }
                .background(.backgroundsPrimary)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Characters")
                        .font(.headLine1)
                        .foregroundStyle(.foregroundsPrimary)
                }
            }
        }
        
    }
}

#Preview {
    FavoriteCharacterView()
}
