//
//  SearchNews.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 1/9/2024.
//

import Foundation

func performSearch(query: String, allNews: [News]) -> [News] {
    if query.isEmpty {
        []
    } else {
        allNews.filter { news in
            news.title.lowercased().contains(query.lowercased())
        }
    }
}
