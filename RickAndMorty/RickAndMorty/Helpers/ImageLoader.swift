//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Roman on 16/02/2025.
//

import SwiftUI
import Kingfisher

struct ImageLoader: View {
    let widthOfImage: CGFloat
    let character: Result
    var body: some View {
            if let url = character.image, let imageURL = URL(string: url) {
                KFImage(imageURL)
                    .resizable()
                   // .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    //.padding()
                   // .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
                    .frame(width: widthOfImage, height: widthOfImage)
            }
    }
}

//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
