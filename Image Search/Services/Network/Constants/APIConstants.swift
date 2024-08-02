//
//  APIConstants.swift
//  Image Search
//
//  Created by Артур on 01.08.2024.
//

import Foundation

enum APIConstant {
    static let apiKey: String = {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            print("Couldn't find file 'Config.plist'.")
            return .init()
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            print("Couldn't find key 'API_KEY' in 'Config.plist'.")
            return .init()
        }
        return value
    }()
    
    enum QueryItem {
        static let query = "query"
        static let page = "page"
        static let perPage = "per_page"
        static let clientId = "client_id"
    }
}
