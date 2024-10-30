//
//  NewsBlendWidget.swift
//  NewsBlendWidget
//
//  Created by Abdullah Jaswal on 13/10/2024.
//

import SwiftUI
import WidgetKit

struct NewsProvider: TimelineProvider {
    func placeholder(in _: Context) -> NewsEntry {
        NewsEntry(date: Date(), newsItems: placeholderNews())
    }

    func getSnapshot(in _: Context, completion: @escaping (NewsEntry) -> Void) {
        let entry = NewsEntry(date: Date(), newsItems: placeholderNews())
        completion(entry)
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<NewsEntry>) -> Void) {
        fetchNews { newsItems in
            let currentDate = Date()
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: currentDate) ?? currentDate.addingTimeInterval(1800)
            let entry = NewsEntry(date: currentDate, newsItems: newsItems)

            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }

    func placeholderNews() -> [News] {
        []
    }

    func fetchNews(completion: @escaping ([News]) -> Void) {
        let url = URL(string: "https://newsblend.abdullahjaswal.com/news/article/")!

        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(placeholderNews())
                return
            }

            guard let data else {
                completion(placeholderNews())
                return
            }

            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                let limitedNews = Array(newsResponse.results.prefix(3))
                completion(limitedNews)
            } catch {
                completion(placeholderNews())
            }
        }.resume()
    }
}

struct NewsEntry: TimelineEntry {
    let date: Date
    let newsItems: [News]
}

struct NewsWidgetEntryView: View {
    var entry: NewsEntry

    var body: some View {
        if entry.newsItems.isEmpty {
            Text("No news available")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
        } else {
            VStack(alignment: .center, spacing: 4) {
                Label {
                    Text("Recent News")
                        .font(.headline)
                        .bold()
                        .fontDesign(.rounded)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                } icon: {
                    Image(systemName: "tornado")
                        .foregroundStyle(.yellow)
                }
                .frame(alignment: .center)
                .padding(.bottom, 4)

                ForEach(entry.newsItems.prefix(3)) { news in
                    VStack(alignment: .leading) {
                        HStack {
                            if news.is_breaking_news {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                                    .imageScale(.small)
                            }

                            Text(news.title)
                                .font(.subheadline)
                                .bold()
                                .fontDesign(.rounded)
                                .lineLimit(1)
                        }
                        .frame(alignment: .leading)

                        Text(getRelativeDateTime(from: news.published_at))
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .fontDesign(.rounded)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .padding()
            .containerBackground(for: .widget) {
                Color(UIColor.systemBackground)
            }
        }
    }
}

@main
struct NewsBlendWidget: Widget {
    let kind: String = "NewsBlendWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NewsProvider()) { entry in
            NewsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Recent News")
        .description("Displays the 3 recent news articles.")
        .supportedFamilies([.systemMedium])
    }
}
