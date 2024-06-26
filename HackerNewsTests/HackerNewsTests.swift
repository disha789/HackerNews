//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by Disha patel on 6/25/24.
//

import XCTest
@testable import HackerNews

final class HackerNewsTests: XCTestCase {

    var viewModel: HackerNewsViewModel?
    var objAPIHandler: APIHandler?
    
    override func setUpWithError() throws {
        viewModel = HackerNewsViewModel()
        objAPIHandler = APIHandler.shared
    }

    override func tearDownWithError() throws {
        viewModel = nil
        objAPIHandler = nil
    }
    
    func testGetNewsCount() {
        viewModel?.news = HackerNews(hits: [
            Hit(author: "", title: "", points: 12, comments: 12),
            Hit(author: "", title: "", points: 34, comments: 44)
        ])
        XCTAssertEqual(viewModel?.getNewsCount(), 2)
    }
    
    func testGetNewsForValidRow() {
        viewModel?.news = HackerNews(hits: [
            Hit(author: "", title: "Dp", points: 34, comments: 44)
        ])
        
        let news = viewModel?.getNewsFor(row: 0)
        XCTAssertNotNil(news)
        XCTAssertEqual(news?.title, "Dp")
    }
    
    func testGetNewsForInvalidRow() {
        viewModel?.news = HackerNews(hits: [
            Hit(author: "", title: "Dp", points: 34, comments: 44)
        ])
        
        let news = viewModel?.getNewsFor(row: 1)
        XCTAssertNil(news)
    }
    
    func testFetchData() {
        objAPIHandler?.fetch(model: Data.self, URLString: "", completion: { news in
            XCTAssertNil(news)
        })
    }
    
    
}
