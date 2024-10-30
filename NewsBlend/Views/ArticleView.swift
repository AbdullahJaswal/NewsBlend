//
//  ArticleView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 1/9/2024.
//

import SwiftData
import SwiftUI

struct ArticleView: View {
    let newsItem: News
    @State private var showTimeline = false

    var accent: Color {
        newsItem.is_breaking_news ? Color.red : Color.green
    }

    @Environment(\.modelContext) private var context
    @Query private var bookmarkedNews: [NewsDataModel]

    let fromBookmarksView: Bool

    init(
        newsItem: News,
        fromBookmarksView: Bool = false
    ) {
        self.newsItem = newsItem
        self.fromBookmarksView = fromBookmarksView
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                if showTimeline {
                    // Only show the TimelineView when the user swipes left
                    if !newsItem.timeline.isEmpty {
                        TimelineView(
                            newsItem: newsItem,
                            accent: accent
                        )
                    }
                } else {
                    // Other article views here (only shown when not swiped)
                    ArticleHeaderView(
                        newsItem: newsItem,
                        accent: accent
                    )

                    Divider()

                    if !newsItem.points.isEmpty {
                        KeyPointsView(
                            points: newsItem.points,
                            accent: accent
                        )
                    }

                    HStack(alignment: .center) {
                        Spacer()
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 4, height: 4)
                            .foregroundColor(accent)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 4, height: 4)
                            .foregroundColor(accent)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 4, height: 4)
                            .foregroundColor(accent)
                        Spacer()
                    }.padding()
                    
                    if let location = newsItem.location {
                        ArticleLocation(
                            location: location,
                            sentiment: newsItem.sentiment,
                            is_breaking_news: newsItem.is_breaking_news
                        )
                    }

                    if !newsItem.content.isEmpty {
                        ArticleTextContent(
                            content: newsItem.content,
                            keywords: newsItem.keywords,
                            quotes: newsItem.quotes,
                            accent: accent
                        )
                    }

                    Divider()

                    if !newsItem.urls.isEmpty {
                        RelatedLinksView(
                            urls: newsItem.urls,
                            accent: accent
                        )
                    }
                }
            }
            .padding(8)
            .background(
                TwoFingerSwipeGesture(
                    onSwipeLeft: {
                        withAnimation {
                            showTimeline = true
                        }
                    },
                    onSwipeRight: {
                        withAnimation {
                            showTimeline = false
                        }
                    }
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.clear)
            )
        }
        .navigationBarTitle("")
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment: .center) {
                    let icon = newsItem.is_breaking_news == true ? "exclamationmark.triangle.fill" : "newspaper.fill"
                    let text = newsItem.is_breaking_news == true ? "Breaking News" : "News"

                    Image(systemName: icon)
                        .foregroundStyle(accent)
                        .scaleEffect(1.1)
                        .offset(x: -5)

                    Text(text)
                        .font(.title2)
                        .fontWeight(.bold)

                    if !fromBookmarksView {
                        var isBookmarked = bookmarkedNews.contains {
                            $0.slug == newsItem.slug
                        }

                        Divider()
                            .padding(.horizontal, 6)

                        Button(action: {
                            if isBookmarked == true {
                                removeBookmark(newsItem: newsItem)
                            } else {
                                addBookmark(newsItem: newsItem)
                            }

                            isBookmarked = !isBookmarked
                        }) {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                .foregroundStyle(isBookmarked ? Color.yellow : Color.gray)
                        }
                    }
                }
            }
        }
    }

    func addBookmark(newsItem: News) {
        let news = NewsDataModel(news: newsItem)
        context.insert(news)
        try? context.save()
    }

    func removeBookmark(newsItem: News) {
        if let newsToRemove = bookmarkedNews.first(where: { $0.slug == newsItem.slug }) {
            context.delete(newsToRemove)
            try? context.save()
        }
    }
}

#Preview("Breaking News") {
    ArticleView(
        newsItem: NewsData.sampleBreakingNewsList[0]
    )
}

#Preview("Regular News") {
    ArticleView(
        newsItem: NewsData.sampleNewsList[0]
    )
}
