//
//  MainCharactersView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct MainCharactersView: View {
    @State private var viewModel = MainCharacterVM()
    @State var inputText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundsPrimary.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    SearchInput(searchText: $inputText)
                    ForEach(viewModel.characters, id: \.id) { character in
                        NavigationLink(
                            destination: DetailView(backButtonTitle: character.name, idOfCharacter: character.id)
                            ) {
                            ListOfCharacters(character: character)
                                    
                        }
                            
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Characters")
                        .font(.headLine1)
                        .foregroundStyle(.foregroundsPrimary)
                }
            }
        }
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    MainCharactersView()
}


struct SearchInput: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("Search character", text: $searchText)
                .foregroundColor(.foregroundsSecondary)
                .font(.paragraphMedium)
                .padding(.leading, 40)
                .overlay(
                    Image("search")
                        .frame(width: 18, height: 18)
                        .foregroundColor(.iconsPrimary)
                        .padding()
                        .offset(x: -5)
                    , alignment: .leading
                )
        }
        .font(.paragraphMedium)
        .frame(height: 32)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.secondary.opacity(0.1))
                .shadow(color: .black, radius: 10, x: 0, y: 0))
        
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 24)
    }
}
