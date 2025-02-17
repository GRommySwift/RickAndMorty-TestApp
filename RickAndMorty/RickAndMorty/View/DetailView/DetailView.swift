//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct DetailView: View {
    @State private var viewModel = DetailViewVM()
    var frameHeight: CGFloat {
            let screenHeight = UIScreen.main.bounds.height
        let heightRatio: CGFloat = screenHeight > 736 ? 1.85 : 1.41
            return screenHeight / heightRatio
        }
    
    var body: some View {
        NavigationView {
            ForEach(viewModel.character, id: \.id) { character in
                VStack(spacing: 0) {
                    HStack() {
                        ImageLoader(widthOfImage: 140, character: character)
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.paragraphMedium)
                                .foregroundColor(.foregroundsSecondary)
                                .offset(y: -30)
                            Text(character.name)
                                .font(.headLine2)
                                .foregroundColor(.foregroundsPrimary)
                                .frame(width: 100, alignment: .leading)
                                .offset(y: -20)
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(height: 160)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .overlay(
                        Image("favorites_inactive")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.iconsSecondary)
                            .offset(x: -15, y: 15),
                        alignment: .topTrailing
                    )
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.foregroundsSeparator)
                        HStack {
                            VStack(alignment: .leading, spacing: 27) {
                                Text("Status")
                                Text("Species")
                                Text("Type")
                                Text("Gender")
                                Text("Origin")
                                Text("Location")
                            }
                            .font(.paragraphSmall)
                            .foregroundStyle(.foregroundsSecondary)
                            .padding(.leading, 24)
                            .padding(.trailing, 47)
                            VStack(alignment: .leading, spacing: 27) {
                                Text(character.status)
                                Text(character.species)
                                Text(character.type.isEmpty ? "-" : character.type)
                                Text(character.gender)
                                Text(character.origin.name)
                                Text(character.location.name)
                            }
                            .font(.headLine3)
                            .foregroundStyle(.foregroundsPrimary)
                            Spacer()
                        }
                        .padding(.bottom, 24)
                        .padding(.top, 24)
                }
                .frame(width: UIScreen.main.bounds.width / 1.13, height: frameHeight)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 4)
            }
            
        }
        .task {
            await viewModel.fetchCharacter()
        }
    }
}

#Preview {
    DetailView()
}
