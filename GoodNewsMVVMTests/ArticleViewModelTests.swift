//
//  ArticleViewModelTests.swift
//  GoodNewsMVVMTests
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import XCTest
@testable import GoodNewsMVVM

final class ArticleViewModelTests: XCTestCase {

    override func setUpWithError() throws {

        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ArticleViewModel_Init_shouldCorrectlyBePopulatedByModel() {
        let source1 = Source(id: "BBC", name: "MockName")
        let article1 = Article(title: "Mock Title", author: "Mock Author", source: source1, publishedAt: "BBC", url: "BBC.com")
        
        let viewModel = ArticleViewModel(article1)
            
        XCTAssertEqual(viewModel.title, "Mock Title")
        XCTAssertEqual(viewModel.author, "Mock Author")
        }
    
    func test_ArticleListViewModel_Init_shouldCorrectlyBePopulatedByArray() {
        let source1 = Source(id: "BBC", name: "MockName")
        let source2 = Source(id: "ITV", name: "MockName2")
            let articles = [Article(title: "Mock Title", author: "Mock Author", source: source1, publishedAt: "BBC", url: "BBC.com"), Article(title: "Fake Title", author: "Fake Author", source: source2, publishedAt: "ITV", url: "ITV.com")]
            let listViewModel = ArticleListViewModel(articles: articles)
            
            XCTAssertEqual(listViewModel.numberOfRowsInSection(0), 2)
        }

}
