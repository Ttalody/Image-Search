//
//  URLConfiguration.swift
//  Image Search
//
//  Created by Артур on 31.07.2024.
//

import Foundation

class URLConfiguration {
    let endpoint: String
    let query: [String: String]
    
    init(
        endpoint: String = .init(),
        query: [String: String] = [:]
    ) {
        self.endpoint = endpoint
        self.query = query
    }
}
