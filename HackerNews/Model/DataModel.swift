//
//  DataModel.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import Foundation

struct HackerNews: Codable {
    let hits: [Hit]
}

struct Hit: Codable{
    let author: String?
    let title: String?
    let points: Int?
    let comments: Int?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case points = "points"
        case comments = "num_comments"
    }
}
