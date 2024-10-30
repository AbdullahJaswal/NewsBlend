//
//  BookmarksView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 9/10/2024.
//

import SwiftData
import SwiftUI

struct BookmarksView: View {
    @Environment(\.modelContext) private var context
    @Query private var bookmarkedNews: [NewsDataModel]

    var body: some View {
        NavigationStack {
            Group {
                if bookmarkedNews.isEmpty {
                    VStack {
                        Image(systemName: "bookmark.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)

                        Text("No Bookmarks Yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)

                        Text("You can bookmark articles to save them for later.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemGroupedBackground))
                } else {
                    ScrollView {
                        ForEach(bookmarkedNews) { newsItem in
                            NewsItemView(
                                newsItem: newsItem.getNews(),
                                fromBookmarksView: true
                            )
                            .padding()
                            .id(newsItem.slug)
                            .contextMenu {
                                Button(role: .destructive, action: {
                                    deleteBookmark(newsItem: newsItem)
                                }) {
                                    Label("Delete", systemImage: "trash")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookmarks")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }

    private func deleteBookmark(newsItem: NewsDataModel) {
        context.delete(newsItem)
        try? context.save()
    }
}
