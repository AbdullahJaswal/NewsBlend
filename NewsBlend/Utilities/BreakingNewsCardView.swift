//
//  BreakingNewsCardView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 31/8/2024.
//

import SwiftUI

struct BreakingNewsCardView: View {
    let newsItem: News
    @State private var isExpanded = false

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
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

            // Body
            Text(newsItem.title)
                .font(.title)
                .fontWeight(.bold)

            // Footer
            NewsInfoView(newsItem: newsItem, accent: Color.yellow)

            // Summary (onTouch)
            if isExpanded {
                VStack {
                    Text(newsItem.summary)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .padding(.top, 8)

                    NavigationLink(destination: ArticleView(newsItem: newsItem)) {
                        HStack {
                            Spacer()

                            Text("Read Article")
                                .fontWeight(.medium)
                                .underline()
                            Image(systemName: "arrow.right.circle.fill")
                        }
                        .foregroundColor(.yellow)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .cornerRadius(20)
                    }
                }
            }
        }
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Rectangle()
                .fill(colorScheme == .light ? Color.white : Color.black)
        )
        .onTapGesture {
            withAnimation(.easeInOut) {
                isExpanded.toggle()
            }
        }
    }
}

#Preview {
    BreakingNewsCardView(
        newsItem: NewsData.sampleBreakingNewsList[0]
    )
}
