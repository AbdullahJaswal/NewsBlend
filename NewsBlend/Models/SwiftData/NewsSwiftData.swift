//
//  NewsSwiftData.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 9/10/2024.
//

import Foundation
import SwiftData

@Model
class NewsDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var title: String
    var score: Int
    var sentiment: SentimentDataModel
    var slug: String
    var summary: String
    var content: String

    var keywordsData: Data?
    var pointsData: Data?

    var quotes: [QuoteDataModel]
    var timeline: [TimelineEventDataModel]
    var location: LocationDataModel?
    var categories: [CategoryDataModel]
    var urls: [String]
    var images: [String]
    var published_at: Date
    var is_breaking_news: Bool = false

    var keywords: [String: String] {
        get {
            if let data = keywordsData {
                return (try? JSONDecoder().decode([String: String].self, from: data)) ?? [:]
            }
            return [:]
        }
        set {
            keywordsData = try? JSONEncoder().encode(newValue)
        }
    }

    var points: [String: String] {
        get {
            if let data = pointsData {
                return (try? JSONDecoder().decode([String: String].self, from: data)) ?? [:]
            }
            return [:]
        }
        set {
            pointsData = try? JSONEncoder().encode(newValue)
        }
    }

    init(
        title: String,
        score: Int,
        sentiment: SentimentDataModel,
        slug: String,
        summary: String,
        content: String,
        keywords: [String: String],
        points: [String: String],
        quotes: [QuoteDataModel],
        timeline: [TimelineEventDataModel],
        location: LocationDataModel?,
        categories: [CategoryDataModel],
        urls: [String],
        images: [String],
        published_at: Date,
        is_breaking_news: Bool
    ) {
        self.title = title
        self.score = score
        self.sentiment = sentiment
        self.slug = slug
        self.summary = summary
        self.content = content
        self.quotes = quotes
        self.timeline = timeline
        self.location = location
        self.categories = categories
        self.urls = urls
        self.images = images
        self.published_at = published_at
        self.is_breaking_news = is_breaking_news

        keywordsData = try? JSONEncoder().encode(keywords)
        pointsData = try? JSONEncoder().encode(points)
    }

    init(news: News) {
        id = news.id
        title = news.title
        score = news.score

        sentiment = SentimentDataModel(type: news.sentiment.rawValue)

        slug = news.slug
        summary = news.summary
        content = news.content

        keywordsData = try? JSONEncoder().encode(news.keywords)
        pointsData = try? JSONEncoder().encode(news.points)

        quotes = news.quotes.map { QuoteDataModel(name: $0.name, quote: $0.quote) }

        timeline = news.timeline.map { TimelineEventDataModel(event: $0.event, datetime: $0.datetime) }

        if let loc = news.location {
            location = LocationDataModel(city: loc.city, country: loc.country, latitude: loc.latitude, longitude: loc.longitude)
        } else {
            location = nil
        }

        categories = news.categories.map { CategoryDataModel(name: $0.name, slug: $0.slug) }

        urls = news.urls
        images = news.images
        published_at = news.published_at
        is_breaking_news = news.is_breaking_news
    }

    func getNews() -> News {
        News(
            title: title,
            score: score,
            sentiment: sentiment.getSentiment(),
            slug: slug,
            summary: summary,
            content: content,
            keywords: keywords,
            points: points,
            quotes: quotes.map { $0.getQuote() },
            timeline: timeline.map { $0.getTimelineEvent() },
            location: location?.getLocation(),
            categories: categories.map { $0.getCategory() },
            urls: urls,
            images: images,
            published_at: published_at.ISO8601Format(),
            is_breaking_news: is_breaking_news
        )
    }
}

@Model
class SentimentDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var type: String

    init(type: String) {
        self.type = type
    }

    func getSentiment() -> Sentiment {
        Sentiment(rawValue: type) ?? .neutral
    }
}

@Model
class CategoryDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var name: String
    var slug: String

    init(name: String, slug: String) {
        self.name = name
        self.slug = slug
    }

    func getCategory() -> Category {
        Category(name: name, slug: slug)
    }
}

@Model
class QuoteDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var name: String
    var quote: String

    init(name: String, quote: String) {
        self.name = name
        self.quote = quote
    }

    func getQuote() -> Quote {
        Quote(name: name, quote: quote)
    }
}

@Model
class TimelineEventDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var event: String
    var datetime: Date?

    init(event: String, datetime: Date?) {
        self.event = event
        self.datetime = datetime
    }

    func getTimelineEvent() -> TimelineEvent {
        TimelineEvent(event: event, datetime: datetime)
    }
}

@Model
class LocationDataModel: Identifiable {
    @Attribute var id: UUID = UUID()

    var city: String
    var country: String
    var latitude: Double
    var longitude: Double

    init(city: String, country: String, latitude: Double, longitude: Double) {
        self.city = city
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }

    func getLocation() -> Location {
        Location(city: city, country: country, latitude: latitude, longitude: longitude)
    }
}
