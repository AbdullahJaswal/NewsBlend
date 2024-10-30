//
//  NewsItemView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 1/9/2024.
//

import SwiftUI

struct NewsItemView: View {
    let newsItem: News

    var accent: Color {
        newsItem.is_breaking_news ? Color.red : Color.green
    }

    let fromBookmarksView: Bool

    init(
        newsItem: News,
        fromBookmarksView: Bool = false
    ) {
        self.newsItem = newsItem
        self.fromBookmarksView = fromBookmarksView
    }

    var body: some View {
        NavigationLink(
            destination: ArticleView(
                newsItem: newsItem,
                fromBookmarksView: fromBookmarksView
            )
        ) {
            VStack(alignment: .leading, spacing: 10) {
                // Image
                if let image = newsItem.images.first {
                    AsyncImage(url: URL(string: image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case let .success(image):
                            image.resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(7)
                                .padding(1)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .frame(height: 200)
                                .foregroundColor(.gray.opacity(0.25))
                                .cornerRadius(7)
                                .padding(1)
                                .padding(.horizontal, 3)
                        @unknown default:
                            ProgressView()
                                .frame(height: 200)
                        }
                    }
                }

                VStack {
                    // Header
                    Text(newsItem.title)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 2)

                    // Body
                    Text(newsItem.summary)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)

                    // Footer
                    NewsInfoView(newsItem: newsItem, accent: accent)
                }
                .padding(.horizontal, 6)
                .padding(.bottom, 10)
            }
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color(UIColor.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
            )
            .shadow(radius: 0.25)
        }
        .buttonStyle(NewsItemButtonStyle())
    }
}

struct NewsItemButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview("Breaking News") {
    NewsItemView(newsItem: NewsData.sampleBreakingNewsList[0])
}

#Preview("Regular News") {
    NewsItemView(newsItem: NewsData.sampleNewsList[0])
}
