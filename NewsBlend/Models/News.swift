import Foundation

struct News: Codable, Equatable, Identifiable {
    var id: UUID = .init()

    let title: String
    let score: Int
    let sentiment: Sentiment
    let slug: String
    let summary: String
    let content: String
    let keywords: [String: String]
    let points: [String: String]
    let quotes: [Quote]
    let timeline: [TimelineEvent]
    let location: Location?
    let categories: [Category]
    let urls: [String]
    let images: [String]
    let published_at: Date
    let is_breaking_news: Bool

    enum CodingKeys: String, CodingKey {
        case title
        case score
        case sentiment
        case slug
        case summary
        case content
        case keywords
        case points
        case quotes
        case timeline
        case location
        case categories
        case urls
        case images
        case published_at
        case is_breaking_news
    }

    init(
        title: String,
        score: Int,
        sentiment: Sentiment,
        slug: String,
        summary: String,
        content: String,
        keywords: [String: String],
        points: [String: String],
        quotes: [Quote],
        timeline: [TimelineEvent],
        location: Location?,
        categories: [Category],
        urls: [String],
        images: [String],
        published_at: String,
        is_breaking_news: Bool
    ) {
        self.title = title
        self.score = score
        self.sentiment = sentiment
        self.slug = slug
        self.summary = summary
        self.content = content
        self.keywords = keywords
        self.points = points
        self.quotes = quotes
        self.timeline = timeline
        self.location = location
        self.categories = categories
        self.urls = urls
        self.images = images
        self.is_breaking_news = is_breaking_news

        // ISO8601 date string converted to Local Date object
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
        sentiment = try container.decode(Sentiment.self, forKey: .sentiment)
        slug = try container.decode(String.self, forKey: .slug)
        summary = try container.decode(String.self, forKey: .summary)
        content = try container.decode(String.self, forKey: .content)
        keywords = try container.decode([String: String].self, forKey: .keywords)
        points = try container.decode([String: String].self, forKey: .points)
        quotes = try container.decode([Quote].self, forKey: .quotes)
        timeline = try container.decode([TimelineEvent].self, forKey: .timeline)

        if let locContainer = try? container.nestedContainer(keyedBy: Location.CodingKeys.self, forKey: .location) {
            let country = try locContainer.decodeIfPresent(String.self, forKey: .country)
            let city = try locContainer.decodeIfPresent(String.self, forKey: .city)
            let latitude = try locContainer.decodeIfPresent(Double.self, forKey: .latitude)
            let longitude = try locContainer.decodeIfPresent(Double.self, forKey: .longitude)

            if let country, !country.isEmpty,
               let city, !city.isEmpty,
               let latitude,
               let longitude {
                location = Location(city: city, country: country, latitude: latitude, longitude: longitude)
            } else {
                location = nil
            }
        } else {
            location = nil
        }

        categories = try container.decode([Category].self, forKey: .categories)
        urls = try container.decode([String].self, forKey: .urls)

        let imageArray = try container.decodeIfPresent([String?].self, forKey: .images)
        images = imageArray?.compactMap { $0 } ?? []

        is_breaking_news = try container.decode(Bool.self, forKey: .is_breaking_news)

        if let localDate = try convertToLocalDate(
            from: container.decode(String.self, forKey: .published_at)
        ) {
            published_at = localDate
        } else {
            published_at = Date()
        }
    }
}

enum Sentiment: String, Codable, Equatable {
    case positive
    case negative
    case neutral
}

struct Category: Codable, Equatable, Hashable {
    let name: String
    let slug: String
}

struct Quote: Codable, Equatable {
    let name: String
    let quote: String
}

struct TimelineEvent: Codable, Equatable, Identifiable {
    let id = UUID()

    let event: String
    let datetime: Date?

    enum CodingKeys: String, CodingKey {
        case event
        case datetime
    }

    init(event: String, datetime: Date?) {
        self.event = event
        self.datetime = datetime
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        event = try container.decode(String.self, forKey: .event)

        let datetimeString = try container.decode(String.self, forKey: .datetime)
        if let localDate = convertToLocalDate(from: datetimeString) {
            datetime = localDate
        } else {
            datetime = nil
        }
    }

    func getDatetime(
        format: String = "MMMM d, yyyy – h:mm a (zzz)"
    ) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        if let timelineDatetime = datetime {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: timelineDatetime)

            // Only display date when no specific time is given
            if components.hour == 0 || components.hour == 12, components.minute == 0 {
                dateFormatter.dateFormat = "MMMM d, yyyy"
            }

            return dateFormatter.string(from: timelineDatetime)
        }

        return nil
    }
}

struct Location: Codable, Equatable, Identifiable {
    let id = UUID()

    let city: String
    let country: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case city
        case country
        case latitude
        case longitude
    }
}
