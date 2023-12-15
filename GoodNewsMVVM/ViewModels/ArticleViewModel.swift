//
//  ArticleViewModel.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
}
extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
