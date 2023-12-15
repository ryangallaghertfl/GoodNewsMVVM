//
//  Article.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import Foundation

struct ResponseData: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let author: String?
    let source: Source
    let publishedAt: String
    let url: String
}

struct Source: Decodable {
    let id: String?
    let name: String
}


