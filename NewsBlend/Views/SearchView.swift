//
//  SearchView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 1/9/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var searchResults: [News] = []

    @State private var searchDebounceTimer: Timer?
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView("Searching")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    if searchResults.isEmpty {
                        VStack {
                            if searchText.isEmpty {
                                CategoriesScreenView()
                            } else {
                                Image(systemName: "exclamationmark.magnifyingglass")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(
                                        width: 100,
                                        height: 100,
                                        alignment: .center
                                    )
                                    .foregroundColor(.gray)

                                Text("No results found")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .padding(.top, 8)
                            }
                        }
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(searchResults, id: \.slug) { newsItem in
                                    NewsItemView(newsItem: newsItem)
                                        .id(newsItem.slug)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search Politics, Economy, Technology, and more..."
        )
        .onChange(of: searchText) { _, newValue in
            isLoading = true

            searchDebounceTimer?.invalidate()

            if newValue.isEmpty {
                searchResults = []
                isLoading = false
            } else {
                // 1 second delay to not overload the API
                searchDebounceTimer = Timer.scheduledTimer(
                    withTimeInterval: 1.0,
                    repeats: false
                ) { _ in
                    performSearch(query: newValue)
                }
            }
        }
    }

    func performSearch(query: String) {
        let url = URL(string: "https://newsblend.abdullahjaswal.com/news/article/?search=\(query.lowercased())&page_size=100")!

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
                    let article = decodedData.results.filter { article in
                        !searchResults.contains(where: { $0.slug == article.slug })
                    }

                    searchResults.append(contentsOf: article)
                    isLoading = false
                }
            } catch {
                print("Decoding error: \(error)")
                isLoading = false
            }
        }.resume()
    }
}

#Preview {
    SearchView()
}
