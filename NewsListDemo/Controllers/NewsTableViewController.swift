//
//  NewsTableViewController.swift
//  NewsListDemo
//
//  Created by Abhishek Gupta on 16/11/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articleListVM: ArtileListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getDataFromServer()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .darkGray
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    private func getDataFromServer() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2d58005f9ab546dd945d1ca949e0af79")!
        WebServices().getArticlesList(url: url) { (articles) in
            if let artilces = articles {
                self.articleListVM = ArtileListViewModel(articles: artilces)
          
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titileLabel.text = articleVM.titile
        cell.descriptionLabel.text = articleVM.description
        cell.idLabel.text = articleVM.id
        cell.nameLabel.text = articleVM.name
        return cell
    }
}

#if DEBUG
extension NewsTableViewController {
    
    var testable_tableView: UITableView! {
        return self.tableView
    }
    
}
#endif
