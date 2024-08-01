//
//  ImageModel.swift
//  Image Search
//
//  Created by Артур on 30.07.2024.
//

import Foundation

struct ImageResponse: Codable {
    let totalPages: Int
    let results: [ImageModel]

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case results
    }
}

struct ImageModel: Codable, Identifiable, Equatable {
    let id: String
    let description: String?
    let imageUrls: URLs

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case imageUrls = "urls"
    }
    
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.id == rhs.id
    }
}

struct URLs: Codable {
    let small: String

    enum CodingKeys: String, CodingKey {
        case small
    }
}
