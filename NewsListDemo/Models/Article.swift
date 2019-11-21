//
//  Article.swift
//  NewsListDemo
//
//  Created by Abhishek Gupta on 18/11/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
}
