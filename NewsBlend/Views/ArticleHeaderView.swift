//
//  ArticleHeaderView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct ArticleHeaderView: View {
    let newsItem: News
    let accent: Color

    var body: some View {
        VStack(alignment: .leading) {
            // Image
            if !newsItem.images.isEmpty {
                TabView {
                    ForEach(newsItem.images, id: \.self) { imageUrl in
                        if let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { phase in
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
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(height: 200)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(height: 200)
                    .padding(1)

                Text("No images available")
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            if newsItem.is_breaking_news {
                Label {
                    Text("Breaking")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                } icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
            }

            Text(newsItem.title)
                .font(.title)
                .fontWeight(.black)

            NewsInfoView(
                newsItem: newsItem,
                accent: accent
            )
            .padding(.top, -10)
            .padding(.bottom, 4)

            Text(newsItem.summary)
                .font(.caption)
                .italic()
                .foregroundStyle(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview("Breaking News") {
    ArticleHeaderView(
        newsItem: NewsData.sampleBreakingNewsList[0],
        accent: Color.red
    )
}

#Preview("Regular News") {
    ArticleHeaderView(
        newsItem: NewsData.sampleNewsList[0],
        accent: Color.green
    )
}
