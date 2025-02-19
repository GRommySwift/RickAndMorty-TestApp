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
    @State private var isSearching = false
    @FocusState var isFocused: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundsPrimary.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    SearchInput(searchText: $inputText, isSearching: $isSearching, isFocused: $isFocused, cleanCharacters: viewModel.cleanSortedCharacters)
                        .onSubmit {
                            Task {
                                await viewModel.searchCharacters(name: inputText)
                            }
                        }
                        .submitLabel(.go)
                    
                    if !isSearching {
                        ForEach(viewModel.characters, id: \.id) { character in
                            NavigationLink(
                                destination: DetailView(backButtonTitle: character.name, idOfCharacter: character.id)
                            ) {
                                ListOfCharacters(character: character, isSearch: isSearching)
                            }
                        }
                    } else {
                        ForEach(viewModel.sortedCharacters, id: \.id) { character in
                            NavigationLink(
                                destination: DetailView(backButtonTitle: character.name, idOfCharacter: character.id)
                            ) {
                                ListOfCharacters(character: character, isSearch: isSearching)
                            }
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
