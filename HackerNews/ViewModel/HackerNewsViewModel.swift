//
//  HackerNewsViewModel.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import Foundation

class HackerNewsViewModel {
    var news: HackerNews?
    var reloadData: (() -> Void)?
    
    func fetchNews(){
        APIHandler.shared.fetch(model: HackerNews.self, URLString: "\(Constants.serverUrl.rawValue)") { Decodable in
            self.news = Decodable
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    func getNewsCount() -> Int{
        return news?.hits.count ?? 0
    }
    
    func getNewsFor(row: Int) -> Hit? {
        if row < getNewsCount() {
            return news?.hits[row]
        }
        return nil
    }
}
