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
                    .font(SearchBarConstants.textFieldFont)
                    .padding(.leading, SearchBarConstants.textFieldPaddingLeading)
                    .focused(isFocused)
                    .onChange(of: isFocused.wrappedValue) {
                        isSearching = true
                    }
                    .overlay(
                        Image("search")
                            .frame(width: SearchBarConstants.iconSize, height: SearchBarConstants.iconSize)
                            .foregroundColor(.iconsPrimary)
                            .padding()
                            .offset(x: SearchBarConstants.iconOffsetX),
                        alignment: .leading
                    )
                    .overlay(
                        Image("x-circle")
                            .opacity(searchText.isEmpty ? 0 : 1)
                            .onTapGesture {
                                searchText = ""
                                cleanCharacters()
                            }
                            .contentShape(Rectangle())
                            .frame(width: SearchBarConstants.clearButtonSize, height: SearchBarConstants.clearButtonSize)
                            .foregroundColor(.iconsPrimary)
                            .padding(.trailing, SearchBarConstants.clearButtonPaddingTrailing),
                        alignment: .trailing
                    )
            }
            .font(SearchBarConstants.textFieldFont)
            .frame(height: SearchBarConstants.textFieldHeight)
            .background(
                RoundedRectangle(cornerRadius: SearchBarConstants.searchBarCornerRadius)
                    .fill(Color.secondary.opacity(SearchBarConstants.searchBarBackgroundOpacity))
                    .shadow(color: .black, radius: SearchBarConstants.searchBarShadowRadius, x: 0, y: 0)
            )
            .padding(.leading, SearchBarConstants.hStackPaddingLeading)
            .padding(.trailing, isSearching ? SearchBarConstants.hStackPaddingTrailingSearching : SearchBarConstants.hStackPaddingTrailingDefault)
            .animation(.easeInOut(duration: SearchBarConstants.animationDuration), value: 0)
            .padding(.top, SearchBarConstants.hStackPaddingTop)
            .padding(.bottom, isSearching ? SearchBarConstants.hStackPaddingBottomSearching : SearchBarConstants.hStackPaddingBottomDefault)
            
            if isSearching {
                Button {
                    isSearching = false
                    searchText = ""
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.foregroundsPrimary)
                        .font(SearchBarConstants.textFieldFont)
                }
                .padding(.bottom, SearchBarConstants.cancelButtonPaddingBottom)
                .padding(.trailing, SearchBarConstants.cancelButtonPaddingTrailing)
            }
        }
    }

}
