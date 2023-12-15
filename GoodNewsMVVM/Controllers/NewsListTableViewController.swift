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
    
    let endpointgb = "https://newsapi.org/v2/top-headlines?country=gb&apiKey=8e8b208c7248435f8cb0f7253bdfb52d"
    let endpointus = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8e8b208c7248435f8cb0f7253bdfb52d"

    // MARK: - Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
    }

    // MARK: - Setup UI
    private func setupUI() {
        // Set the title for the navigation bar
            self.title = "GoodNews"
        
        // Set large titles for navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true

        // Register the custom cell
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")

        // Additional tableView configurations
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

    // MARK: - TableView DataSource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM == nil ? 0 : articleListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM?.numberOfRowsInSection(section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }

        if let articleVM = articleListVM?.articleAtIndex(indexPath.row) {
            cell.titleLabel.text = articleVM.title
            cell.authorLabel.text = articleVM.author
        }
        return cell
    }

    // MARK: - Data Fetching
    private func setup() {
        let url = URL(string: endpointgb)!
        Webservice().getArticles(url: url) { [weak self] articles in
            if let articles = articles {
                self?.articleListVM = ArticleListViewModel(articles: articles)

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}
