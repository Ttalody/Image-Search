//
//  ImageCell.swift
//  Image Search
//
//  Created by Артур on 01.08.2024.
//

import SwiftUI

struct ImageCell: View {
    private enum Constants {
        static let imageSquareSide: CGFloat = 150
        static let cornerRadius: CGFloat = 8
    }
    
    let imageModel: ImageModel

    var body: some View {
        VStack {
            if let url = URL(string: imageModel.imageUrls.small) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.imageSquareSide, height: Constants.imageSquareSide)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            }
            if let description = imageModel.description {
                Text(description)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(Constants.cornerRadius)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
