//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI
import SwiftData
import DataManager

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var favoriteViewModel: FavoriteViewVM
    @State private var viewModel = DetailViewVM()
    @Query private var favorites: [CharacterFavorite]
    
    let backButtonTitle: String
    let idOfCharacter: Int
    
    var isFavorite: Bool {
        favorites.contains { $0.id == idOfCharacter }
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                characterCard
                    .padding(.top)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundsPrimary)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image("arrow_left")
                            .renderingMode(.template)
                            .foregroundStyle(.iconsPrimary)
                        Text(backButtonTitle)
                            .font(.paragraphMedium)
                            .foregroundStyle(.foregroundsPrimary)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundsPrimary)
    }
}

// MARK: - View elements

private extension DetailView {
    
    // MARK: - Character card view
    
    var characterCard: some View {
        VStack {
            ForEach(viewModel.character, id: \.id) { character in
                headerView(character: character)
                Divider().background(Color.foregroundsSeparator)
                detailsView(character: character)
            }
        }
        .task {
            await viewModel.fetchCharacter(id: idOfCharacter)
        }
        .padding(.horizontal, DetailViewConstants.cardPadding)
        .padding(.top, DetailViewConstants.cardPadding)
        .frame(maxWidth: DetailViewConstants.cardMaxWidth)
        .background(.backgroundsTertiary)
        .cornerRadius(DetailViewConstants.cardCornerRadius)
        .shadow(radius: DetailViewConstants.cardShadowRadius)
    }
    
    // MARK: - Header of character card view
    
    func headerView(character: Result) -> some View {
        HStack {
            ImageLoader(widthOfImage: DetailViewConstants.imageWidth, character: character)
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.paragraphMedium)
                    .foregroundColor(.foregroundsSecondary)
                    .offset(x: DetailViewConstants.textXOffset, y: DetailViewConstants.nameYOffset)
                Text(character.name)
                    .font(.headLine2)
                    .foregroundColor(.foregroundsPrimary)
                    .frame(width: DetailViewConstants.textWidth, alignment: .leading)
                    .offset(x: DetailViewConstants.textXOffset, y: DetailViewConstants.valueYOffset)
            }
            Spacer()
        }
        .padding(DetailViewConstants.imagePadding)
        .frame(height: DetailViewConstants.headerHeight)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Image(isFavorite ? "favorites_active" : "favorites_inactive")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: DetailViewConstants.favoriteIconSize, height: DetailViewConstants.favoriteIconSize)
                .foregroundStyle(isFavorite ? .accentPrimary : .iconsSecondary)
                .offset(x: DetailViewConstants.favoriteIconXOffset, y: DetailViewConstants.favoriteIconYOffset),
            alignment: .topTrailing
        )
        .onTapGesture {
            favoriteViewModel.toggleFavorite(character)
        }
    }
    
    // MARK: - Details of character card view
    
    func detailsView(character: Result) -> some View {
        let details: [(title: String, value: String)] = [
            ("Status", character.status),
            ("Species", character.species),
            ("Type", character.type.isEmpty ? "-" : character.type),
            ("Gender", character.gender),
            ("Origin", character.origin.name),
            ("Location", character.location.name)
        ]
        return LazyVGrid(columns: DetailViewConstants.gridColumns, spacing: DetailViewConstants.gridVerticalSpacing) {
            ForEach(details, id: \.title) { detail in
                Text(detail.title)
                    .font(.paragraphSmall)
                    .foregroundStyle(.foregroundsSecondary)
                Text(detail.value)
                    .font(.headLine3)
                    .foregroundStyle(.foregroundsPrimary)
            }
        }
        .padding(.leading, DetailViewConstants.detailsPaddingLeading)
        .padding(.vertical, DetailViewConstants.detailsPaddingVertical)
    }
}

#Preview {
    DetailView(backButtonTitle: "Back", idOfCharacter: 1)
}
