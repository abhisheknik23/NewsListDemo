//
//  ArticleViewModel.swift
//  NewsListDemo
//
//  Created by Abhishek Gupta on 18/11/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation

struct  ArtileListViewModel {
    let articles : [Article]
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
    
    var titile: String {
        if let title = self.article.title{
            return title
        }else {
            return ""
        }
    }
    
    var description: String {
        if let description = self.article.description {
            return description
        }else {
            return ""
        }
    }
    
    var id: String{
        if let id = self.article.source?.id{
            return id
        }else{
            return ""
        }
    }
    
    var name: String{
        if let name = self.article.source?.name{
            return name
        }else{
            return ""
        }
    }
    
}

extension ArtileListViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
