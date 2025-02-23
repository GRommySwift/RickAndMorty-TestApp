//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import DataManager
import Kingfisher

struct ImageLoader<T: CharacterRepresentable>: View {
    let widthOfImage: CGFloat
    let character: T
    var body: some View {
        if let url = character.image, let imageURL = URL(string: url) {
            KFImage(imageURL)
                .resizable()
                .cornerRadius(8)
                .frame(width: widthOfImage, height: widthOfImage)
        }
    }
}
