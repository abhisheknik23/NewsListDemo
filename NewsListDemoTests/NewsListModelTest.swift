//
//  NewsListModelTest.swift
//  NewsListDemoTests
//
//  Created by Abhishek Gupta on 09/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import XCTest

class NewsListModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK:- Empty Dataset
    func testData_empty() {
        let resultData = MockData.newsResultArticleModel(for: .empty)
        XCTAssert(resultData.count == 0, "News Data is empty")
    }
    
    //MARK:- Happy Dataset
    func testSerialization_happy() {
        let resultModel  = MockData.newsResultArticleModel(for: .happy)
        XCTAssertNotNil(resultModel)
    }
    
    //MARK:- MissingValues
    func testSerialization_missingValues() {
        let resultModel = MockData.newsResultArticleModel(for: .missingValues)
        XCTAssertNotNil(resultModel)
    }

}
