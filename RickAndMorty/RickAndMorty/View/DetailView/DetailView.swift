//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct DetailView: View {
    @State private var viewModel = DetailViewVM()

    var body: some View {
            HStack {
                HStack{
                    Text(viewModel.character?.name ?? "")
                    ImageLoader(widthOfImage: 50, character: viewModel.character? ?? "")
                }
                HStack {
                    
                }
            
            .task {
                await viewModel.fetchCharacter()
        }
            
        }
        
    }
}

#Preview {
    DetailView()
}
