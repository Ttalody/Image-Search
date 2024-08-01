//
//  SearchBar.swift
//  Image Search
//
//  Created by Артур on 30.07.2024.
//

import SwiftUI

struct SearchBar: View {
    private enum Constants {
        enum ImageName {
            static let magnifyingGlass = "magnifyingglass"
            static let multiplyCircleFill = "multiply.circle.fill"
        }
        
        enum Grid {
            static let cornerRadius: CGFloat = 8
            static let imagePadding: CGFloat = 7
            static let padding: CGFloat = 10
            static let searchTextPadding: CGFloat = 25
        }
        
        static let buttonText = "Search"
        static let textFieldText = "Search..."
    }
    
    @Binding var text: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField(Constants.textFieldText, text: $text)
                .padding(Constants.Grid.imagePadding)
                .padding(.horizontal, Constants.Grid.searchTextPadding)
                .background(Color(.systemGray6))
                .cornerRadius(Constants.Grid.cornerRadius)
                .overlay(
                    HStack {
                        Image(systemName: Constants.ImageName.magnifyingGlass)
                            .foregroundColor(.gray)
                            .frame(minWidth: .zero, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, Constants.Grid.imagePadding)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = .init()
                            }) {
                                Image(systemName: Constants.ImageName.multiplyCircleFill)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, Constants.Grid.imagePadding)
                            }
                        }
                    }
                )
                .padding(.horizontal, Constants.Grid.padding)
            if !text.isEmpty {
                Button(
                    action: {
                        onSearchButtonClicked()
                    }
                ) {
                    Text(Constants.buttonText)
                }
                .padding(.trailing, Constants.Grid.padding)
                .padding(.leading, -Constants.Grid.padding)
            }
        }
    }
}
