//
//  APIHandler.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    
    private init() {}
    
    func fetch<T: Decodable>(model: T.Type, URLString: String, completion: ((T) -> Void)?) {
        guard let url = URL(string: URLString) else {
            print("\(ServerErrors.invalidServerUrl.rawValue)")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                    completion?(decodedResponse)
                    return
                }
            }
            print("\(ServerErrors.fetchingDataError.rawValue)")
        }.resume()
    }
}
