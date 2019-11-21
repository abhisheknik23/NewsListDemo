//
//  WebServices.swift
//  NewsListDemo
//
//  Created by Abhishek Gupta on 18/11/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation

class WebServices {
    
    func getArticlesList(url: URL, completion: @escaping([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                //print(articleList!)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
