//
//  NewsModel.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 13/10/2024.
//

import Foundation

struct NewsResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [News]
}

struct News: Codable, Equatable, Identifiable {
    var id: UUID = .init()

    let title: String
    let score: Int
    let slug: String
    let summary: String
    let is_breaking_news: Bool
    let images: [String]
    let published_at: Date

    enum CodingKeys: String, CodingKey {
        case title, score, slug, summary, is_breaking_news, images, published_at
    }

    init(
        title: String,
        score: Int,
        slug: String,
        summary: String,
        published_at: String,
        is_breaking_news: Bool,
        images: [String]
    ) {
        id = UUID()
        self.title = title
        self.score = score
        self.slug = slug
        self.summary = summary
        self.is_breaking_news = is_breaking_news
        self.images = images

        if let localDate = convertToLocalDate(from: published_at) {
            self.published_at = localDate
        } else {
            self.published_at = Date()
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        score = try container.decode(Int.self, forKey: .score)
        slug = try container.decode(String.self, forKey: .slug)
        summary = try container.decode(String.self, forKey: .summary)
        is_breaking_news = try container.decode(Bool.self, forKey: .is_breaking_news)
        images = try container.decode([String].self, forKey: .images)

        if let localDate = try convertToLocalDate(
            from: container.decode(String.self, forKey: .published_at)
        ) {
            published_at = localDate
        } else {
            published_at = Date()
        }
    }
}
