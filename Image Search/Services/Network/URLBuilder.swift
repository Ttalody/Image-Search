//
//  URLBuilder.swift
//  Image Search
//
//  Created by Артур on 31.07.2024.
//

import Foundation

struct URLBuilder {
    
    private static let baseURL: URL? = URL(string: "https://api.unsplash.com/")
    
    static func build(from config: URLConfiguration) -> URL? {
        guard let baseURL = self.baseURL, let baseURLWithPath = URL(string: baseURL.absoluteString + config.endpoint) else {
            print("Failed to construct URL with endpoint: \(config.endpoint)")
            return nil
        }
        
        var urlComponents = URLComponents(url: baseURLWithPath, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = config.query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let finalURL = urlComponents?.url else {
            print("Failed to resolve final URL from components.")
            return nil
        }
        
        return finalURL
    }
}
