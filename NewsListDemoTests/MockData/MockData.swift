//
//  MockData.swift
//  NewsListDemoTests
//
//  Created by Abhishek Gupta on 09/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import Foundation
@testable import NewsListDemo
/** An enum to make it convenient to mock the data and organize it */
enum MockData: String {
    case happy = "happy"
    case empty = "empty"
    case missingValues = "result_with_missing_values"
    
    func jsonData() -> [Article] {

        guard let bundle = Bundle(identifier: "com.NewsListDemo"),
            let url = bundle.url(forResource: "\(self.rawValue)_dataset", withExtension: "json")
            else { return []}
        
        guard let jsonData = try? Data(contentsOf: url, options: .mappedIfSafe) else { return []}
        
        guard let jsonResult = try? JSONDecoder().decode(ArticleList.self, from: jsonData) else { return [] }
        
        return jsonResult.articles
    }
    
    static func newsResultArticleModel(for mock: MockData) -> [Article] {
        let mockData = mock.jsonData()
        return mockData
    }
    
    
}

