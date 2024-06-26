//
//  Constants.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import Foundation

enum Constants: String {
    case serverUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
}

enum ServerErrors: String {
    case invalidServerUrl = "Invalid server url"
    case fetchingDataError = "Encountered error while fetching data from server , please check it again"
    case dataParsingError = "Issue while parsing data"
    case dataLoadingError = "Data not loaded"
}
