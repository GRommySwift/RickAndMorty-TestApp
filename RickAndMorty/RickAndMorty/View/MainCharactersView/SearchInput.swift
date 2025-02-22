//
//  SearchInput.swift
//  RickAndMorty
//
//  Created by Roman on 19/02/2025.
//

import SwiftUI

struct SearchInput: View {
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var isFocused: FocusState<Bool>.Binding
    let cleanCharacters: () -> ()
    var body: some View {
        HStack {
            HStack {
                TextField("Search character", text: $searchText)
                    .foregroundColor(.foregroundsSecondary)
                    .font(.paragraphMedium)
                    .padding(.leading, 40)
                    .focused(isFocused)
                    .onChange(of: isFocused.wrappedValue) {
                        isSearching = true
                    }
                    .overlay(
                        Image("search")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.iconsPrimary)
                            .padding()
                            .offset(x: -5)
                        , alignment: .leading
                    )
                
                    .overlay (
                            Image("x-circle")
                                .opacity(searchText.isEmpty ? 0 : 1)
                                .onTapGesture {
                                    searchText = ""
                                    cleanCharacters()
                                }
                                .contentShape(Rectangle())
                                .frame(width: 12, height: 12)
                                .foregroundColor(.iconsPrimary)
                                .padding(.trailing, 8)
                               , alignment: .trailing
                    )
            }
            .font(.paragraphMedium)
            .frame(height: 32)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.secondary.opacity(0.1))
                    .shadow(color: .black, radius: 10, x: 0, y: 0))
            .padding(.leading, 20)
            .padding(.trailing, isSearching ? 0 : 20).animation(.easeInOut(duration: 0.15), value: 0)
            .padding(.top, 10)
            .padding(.bottom, isSearching ? 16 : 24)
            
            if isSearching {
                Button {
                    isSearching = false
                    searchText = ""
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.foregroundsPrimary)
                        .font(.paragraphMedium)
                }
                .padding(.bottom, 6)
                .padding(.trailing, 16)
            }
        }
    }
}
