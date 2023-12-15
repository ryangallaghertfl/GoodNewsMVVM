//
//  NewsListTableViewController.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 14/12/2023.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    let endpointgb =  "https://newsapi.org/v2/top-headlines?country=gb&apiKey=8e8b208c7248435f8cb0f7253bdfb52d"
    let endpointus = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8e8b208c7248435f8cb0f7253bdfb52d"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: endpointgb)!
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
