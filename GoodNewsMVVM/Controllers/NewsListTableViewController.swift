//
//  NewsListTableViewController.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 14/12/2023.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
