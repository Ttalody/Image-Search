//
//  HomeViewModel.swift
//  Image Search
//
//  Created by Артур on 30.07.2024.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private enum Constants {
        static let itemsPerPage = "20"
    }
    
    @Published var images: [ImageModel] = []
    
    private var currentPage = 1
    private var totalPages = 1
    private var cancellables = Set<AnyCancellable>()
    
    func prepareForRequest() {
        currentPage = 1
        images = []
        totalPages = 1
    }
    
    func fetchImages(prompt: String) {
        guard currentPage <= totalPages else {
            return
        }
        
        let urlConfiguration = URLConfiguration(
            endpoint: "search/photos",
            query: [
                APIConstant.QueryItem.clientId : APIConstant.apiKey,
                APIConstant.QueryItem.page : String(currentPage),
                APIConstant.QueryItem.perPage : Constants.itemsPerPage,
                APIConstant.QueryItem.query : prompt
            ]
        )
        
        guard let url = URLBuilder.build(from: urlConfiguration) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ImageResponse.self, decoder: JSONDecoder())
            .replaceError(with: .init(totalPages: .zero, results: .init()))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                self?.images.append(contentsOf: response.results)
                self?.totalPages = response.totalPages
                self?.currentPage += 1
            }
            .store(in: &cancellables)
    }
}
