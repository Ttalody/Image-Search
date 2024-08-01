//
//  HomeView.swift
//  Image Search
//
//  Created by Артур on 30.07.2024.
//

import SwiftUI

struct HomeView: View {
    private enum Constants {
        static let columnSpacing: CGFloat = 10
        static let title = "Image Search"
        static let hintTitle = "Start typing to find the picture"
        static let hintIconName = "lightbulb.min.fill"
        static let hintPadding: CGFloat = 100
    }
    
    @StateObject var viewModel = HomeViewModel()
    
    @State private var searchText: String = .init()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText) {
                    if searchText != .init() {
                        viewModel.prepareForRequest()
                        viewModel.fetchImages(prompt: searchText)
                    }
                }
                ScrollView {
                    if viewModel.images.isEmpty {
                        HStack {
                            Image(systemName: Constants.hintIconName)
                                .font(.title)
                                .foregroundStyle(.yellow)
                            Text(Constants.hintTitle)
                                .font(.headline)
                        }
                        .padding(.top, Constants.hintPadding)
                    }
                    
                    LazyVGrid(columns: columns, spacing: Constants.columnSpacing) {
                        ForEach(viewModel.images) { imageModel in
                            ImageCell(imageModel: imageModel)
                            .onAppear {
                                if imageModel == viewModel.images.last {
                                    viewModel.fetchImages(prompt: searchText)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.title)
        }
    }
}

#Preview {
    HomeView()
}
