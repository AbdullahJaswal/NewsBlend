import SwiftUI

struct IndividualCategoriesHomeView: View {
    let category: Category
    let categoryIcon: String?
    let categoryColor: Color?

    @State private var filteredNews: [News] = []
    @State private var isLoading: Bool = false
    @State private var nextURL: String?

    var body: some View {
        VStack(alignment: .leading) {
            if isLoading, filteredNews.isEmpty {
                HStack {
                    Spacer()
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            } else if !filteredNews.isEmpty {
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(filteredNews, id: \.slug) { newsItem in
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

                            // Load the next page of news when at the end of list
                            GeometryReader { geometry in
                                Color.clear
                                    .onChange(of: geometry.frame(in: .global).maxY) { _, newValue in
                                        let screenHeight = UIScreen.main.bounds.height
                                        if newValue < screenHeight {
                                            loadNextPageIfAvailable()
                                        }
                                    }
                            }
                        }
                        .padding(.top, 10)
                    }
                    .onChange(of: filteredNews.count) {
                        if let lastNewsItem = filteredNews.last {
                            scrollProxy.scrollTo(lastNewsItem.slug, anchor: .bottom)
                        }
                    }
                }
            } else {
                Text("No News Available")
                    .font(.headline)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.horizontal)
        .onAppear {
            if isRunningInPreview() {
                filteredNews = NewsData.sampleNewsList.filter { news in
                    news.categories.contains {
                        $0.name == CategoryData.categories[0].name
                    }
                }
                isLoading = false
            } else {
                getData()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment: .center) {
                    Image(systemName: categoryIcon ?? "newspaper.fill")
                        .foregroundStyle(categoryColor ?? .primary)
                        .scaleEffect(1.25)
                        .offset(x: -5)

                    Text(category.name)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }

    func getData() {
        isLoading = true
        let initialURL = "https://newsblend.abdullahjaswal.com/news/category/\(category.slug)/article/"
        fetchCategoryNewsData(from: initialURL)
    }

    func fetchCategoryNewsData(from urlString: String) {
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
                    let newItems = decodedData.results.filter { newItem in
                        !filteredNews.contains(where: { $0.slug == newItem.slug })
                    }

                    filteredNews.append(contentsOf: newItems)
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

        // fetch after 1 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            fetchCategoryNewsData(from: nextURL)
        }
    }
}

#Preview {
    IndividualCategoriesHomeView(
        category: CategoryData.categories[0],
        categoryIcon: "exclamationmark.triangle",
        categoryColor: .red
    )
}
