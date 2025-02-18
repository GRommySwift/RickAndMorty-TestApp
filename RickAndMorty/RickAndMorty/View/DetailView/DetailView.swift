//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let backButtonTitle: String
    let idOfCharacter: Int
    @State private var viewModel = DetailViewVM()
    var frameHeight: CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let heightRatio: CGFloat = screenHeight > 736 ? 1.85 : 1.41
        return screenHeight / heightRatio
    }
    
    var body: some View {
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
                        .foregroundStyle(.iconsPrimary)
                    Text(backButtonTitle)
                        .font(.paragraphMedium)
                        .foregroundStyle(.foregroundsPrimary)
                }

            }
        }
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
        .padding(.horizontal, UIConstants.cardHorizontalPadding)
        .padding(.top, UIConstants.cardTopPadding)
        .frame(maxWidth: UIConstants.cardMaxWidth)
        .background(.backgroundsTertiary)
        .cornerRadius(UIConstants.cardCornerRadius)
        .shadow(radius: UIConstants.cardShadowRadius)
    }
    
    // MARK: - Header of character card view
    
    func headerView(character: Result) -> some View {
        HStack {
            ImageLoader(widthOfImage: UIConstants.imageWidth, character: character)
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.paragraphMedium)
                    .foregroundColor(.foregroundsSecondary)
                    .offset(x: UIConstants.textXOffset, y: UIConstants.nameYOffset)
                
                Text(character.name)
                    .font(.headLine2)
                    .foregroundColor(.foregroundsPrimary)
                    .frame(width: UIConstants.textWidth, alignment: .leading)
                    .offset(x: UIConstants.textXOffset, y: UIConstants.valueYOffset)
            }
            Spacer()
        }
        .padding(UIConstants.imagePadding)
        .frame(height: UIConstants.headerHeight)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Image("favorites_inactive")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: UIConstants.favoriteIconSize, height: UIConstants.favoriteIconSize)
                .foregroundStyle(.iconsSecondary)
                .offset(x: UIConstants.favoriteIconXOffset, y: UIConstants.favoriteIconYOffset),
            alignment: .topTrailing
        )
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
        
        return LazyVGrid(columns: UIConstants.gridColumns, spacing: UIConstants.gridVerticalSpacing) {
            ForEach(details, id: \.title) { detail in
                Text(detail.title)
                    .font(.paragraphSmall)
                    .foregroundStyle(.foregroundsSecondary)
                
                Text(detail.value)
                    .font(.headLine3)
                    .foregroundStyle(.foregroundsPrimary)
            }
        }
        .padding(.leading, UIConstants.detailsPaddingLeading)
        .padding(.vertical, UIConstants.detailsPaddingVertical)
    }
}

#Preview {
    DetailView(backButtonTitle: "Back", idOfCharacter: 1)
}
