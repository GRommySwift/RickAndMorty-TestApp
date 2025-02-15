//
//  FavoritesView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct FavoriteCharacterView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("No favorites yet")
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height / 2.5)
            }
            .background(.backgroundsPrimary)
        }
    }
}

#Preview {
    FavoriteCharacterView()
}
