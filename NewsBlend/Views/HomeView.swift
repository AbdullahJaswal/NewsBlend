//
//  HomeView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 31/8/2024.
//

import SwiftUI

struct StickyHeader: View {
    @Binding var showTitle: Bool

    var body: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY

            Color.clear
                .onChange(of: minY) { _, newValue in
                    showTitle = newValue < 0
                }
        }
        .frame(height: 0)
    }
}

struct HomeView: View {
    @State private var breakingNewsItems: [News] = []
    @State private var newsItems: [News] = []
    @State private var isLoading: Bool = false
    @State private var nextURL: String?

    @State private var navigationTitleTrigger: Bool = false

    var body: some View {
        NavigationStack {
            ScrollViewReader { _ in
                ScrollView {
                    VStack {
                        if !breakingNewsItems.isEmpty {
                            StickyHeader(showTitle: $navigationTitleTrigger)

                            BreakingNewsView(newsItems: breakingNewsItems)
                                .padding(.top, -10)
                        } else {
                            Spacer(minLength: 120)
                        }

                        StickyHeader(showTitle: $navigationTitleTrigger)
                            .padding(.top, -130)

                        ListNewsView(
                            newsItems: $newsItems,
                            isLoading: $isLoading,
                            loadNextPage: loadNextPageIfAvailable
                        )
                        .padding(.top, -10)
                    }
                }
                .onAppear {
                    if isRunningInPreview() {
                        breakingNewsItems = NewsData.sampleBreakingNewsList
                        newsItems = NewsData.sampleNewsList
                        isLoading = false
                    } else {
                        fetchBreakingNews()
                        fetchRecentNews()
                    }
                }
            }
            .navigationBarTitle(
                navigationTitleTrigger ? "Recent News" : "Breaking News",
                displayMode: .inline
            )
            .edgesIgnoringSafeArea(.top)
        }
    }

    func fetchBreakingNews() {
        let url = URL(string: "https://newsblend.abdullahjaswal.com/news/breaking/")!

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else { return }

            do {
                let decodedData = try JSONDecoder().decode([News].self, from: data)

                DispatchQueue.main.async {
                    breakingNewsItems = decodedData
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }

    func fetchRecentNews() {
        isLoading = true
        let initialURL = "https://newsblend.abdullahjaswal.com/news/article/"
        fetchNewsData(from: initialURL)
    }

    func fetchNewsData(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(APIResponse<News>.self, from: data)

                DispatchQueue.main.async {
                    let newArticles = decodedData.results.filter { article in
                        !newsItems.contains(where: { $0.slug == article.slug })
                    }

                    newsItems.append(contentsOf: newArticles)
                    nextURL = decodedData.next
                    isLoading = false
                }
            } catch {
                print("Decoding error: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
        }.resume()
    }

    func loadNextPageIfAvailable() {
        guard let nextURL, !isLoading else { return }
        isLoading = true

        // Fetch after a 1 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            fetchNewsData(from: nextURL)
        }
    }
}

#Preview {
    HomeView()
}
