//
//  MainCharactersView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI
import SwiftData

struct MainCharactersView: View {
    
    private var viewModel = MainCharacterVM()
    @State var inputText: String = ""
    @State private var isSearching = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundsPrimary.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack {
                        SearchInput(searchText: $inputText, isSearching: $isSearching, isFocused: $isFocused, cleanCharacters: viewModel.cleanSortedCharacters)
                            .onSubmit {
                                Task {
                                    await viewModel.fetchCharacters(type: .searchViewCharacters, name: inputText)
                                }
                            }
                            .submitLabel(.go)
                        if !isSearching {
                            mainView
                        } else {
                            searchView
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
            await viewModel.fetchCharacters(type: .mainViewCharacters)
        }
    }
}

#Preview {
    MainCharactersView()
}

extension MainCharactersView {
    var mainView: some View {
        ForEach(viewModel.characters, id: \.id) { character in
            NavigationLink(
                destination: DetailView(backButtonTitle: character.name, idOfCharacter: character.id)
            ) {
                ListOfCharacters(character: character, isSearch: isSearching)
                    .onAppear {
                        if character.id == viewModel.characters.last?.id {
                            Task {
                                await viewModel.fetchCharacters(type: .mainViewLoadMore)
                            }
                        }
                    }
            }
        }
    }
    
    var searchView: some View {
        ForEach(viewModel.sortedCharacters, id: \.id) { character in
            NavigationLink(
                destination: DetailView(backButtonTitle: character.name, idOfCharacter: character.id)
            ) {
                ListOfCharacters(character: character, isSearch: isSearching)
                    .onAppear {
                        if character == viewModel.sortedCharacters.last {
                            Task {
                                await viewModel.fetchCharacters(type: .searchViewLoadMore)
                            }
                        }
                    }
            }
        }
    }
}
