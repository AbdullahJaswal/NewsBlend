//
//  BreakingNewsView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 27/8/2024.
//

import SwiftUI

struct BreakingNewsView: View {
    let newsItems: [News]

    init(newsItems: [News]) {
        self.newsItems = newsItems

        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.darkGray
    }

    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(newsItems, id: \.slug) { newsItem in
                    ZStack {
                        BreakingNewsLayout {
                            BreakingNewsImageView(newsItem: newsItem)

                            BreakingNewsCardView(newsItem: newsItem)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .padding(.bottom, 80)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .padding(.bottom, 80)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: UIScreen.main.bounds.height)
    }
}

#Preview {
    BreakingNewsView(
        newsItems: NewsData.sampleBreakingNewsList
    )
}
