//
//  ListNewsView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 20/8/2024.
//

import SwiftUI

struct ListNewsView: View {
    @Binding var newsItems: [News]
    @Binding var isLoading: Bool
    let loadNextPage: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            if newsItems.isEmpty, isLoading {
                HStack {
                    Spacer()
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            } else if !newsItems.isEmpty {
                LazyVStack(spacing: 20) {
                    ForEach(newsItems, id: \.slug) { newsItem in
                        NewsItemView(newsItem: newsItem)
                            .id(newsItem.slug)
                    }

                    if isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading...")
                                .progressViewStyle(CircularProgressViewStyle())
                            Spacer()
                        }
                        .padding()
                    }

                    GeometryReader { geometry in
                        Color.clear
                            .frame(height: 1)
                            .onAppear {
                                let screenHeight = UIScreen.main.bounds.height

                                if geometry.frame(in: .global).maxY < screenHeight {
                                    // Load next page data when user reaches the end of scroll
                                    loadNextPage()
                                }
                            }
                    }
                }
            } else {
                VStack {
                    Image(systemName: "doc.questionmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)

                    Text("No News Available")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .offset(y: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGroupedBackground))
            }
        }
    }
}
