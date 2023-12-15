//
//  Article.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import Foundation

struct ArticleList {
    let articles: [Article] //matches the array name in the json payload
}

struct Article: Decodable {
    let title: String
    let description: String
}
