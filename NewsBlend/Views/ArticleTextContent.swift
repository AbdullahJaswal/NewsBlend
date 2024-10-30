//
//  ArticleTextContent.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct KeywordItem: Identifiable {
    let id = UUID()
    let keyword: String
}

struct ArticleTextContent: View {
    let content: String
    let keywords: [String: String]
    let quotes: [Quote]
    let accent: Color

    @State private var selectedKeyword: KeywordItem?
    @State private var showQuotes: Bool = true
    @State private var currentScale: CGFloat = 1.0

    private let sensitivity: CGFloat = 0.025

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            let paragraphs = content.components(separatedBy: "\n\n")
            let numberOfQuotes = quotes.count
            let numberOfParagraphs = paragraphs.count

            ForEach(0 ..< numberOfParagraphs, id: \.self) { index in
                Text(textWithKeywords(paragraphs[index], keywords: keywords, accent: accent))
                    .font(.footnote.monospaced())
                    .fontWeight(.medium)
                    .environment(\.openURL, OpenURLAction { url in
                        let keywordValue = url.lastPathComponent

                        if let matchedKeyword = keywords.first(where: { $0.value == keywordValue }) {
                            selectedKeyword = KeywordItem(keyword: matchedKeyword.key)
                        }

                        return .discarded
                    })

                if showQuotes, index < numberOfQuotes {
                    ArticleQuote(quote: quotes[index], accent: accent, showQuote: showQuotes)
                        .transition(.opacity)
                }
            }
        }
        .simultaneousGesture(
            MagnificationGesture()
                .onChanged { value in
                    currentScale = value
                }
                .onEnded { value in
                    if value < (1.0 - sensitivity) {
                        withAnimation {
                            showQuotes = false
                        }
                    } else if value > (1.0 + sensitivity) {
                        withAnimation {
                            showQuotes = true
                        }
                    }
                    currentScale = 1.0
                }
        )
        .sheet(item: $selectedKeyword) { keywordItem in
            if let keywordContent = keywords[keywordItem.keyword] {
                KeywordDetailView(
                    keyword: keywordItem.keyword,
                    content: keywordContent,
                    accent: accent
                )
                .presentationDetents([.medium, .fraction(0.40)])
                .presentationDragIndicator(.visible)
            }
        }
    }
}

struct KeywordDetailView: View {
    let keyword: String
    let content: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(keyword)
                    .font(.caption2)
                    .bold()
                    .foregroundStyle(.gray)
            } icon: {
                Image(systemName: "info.square.fill")
                    .foregroundStyle(accent)
                    .imageScale(.large)
            }

            Text(content)
                .font(.footnote)

            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(.top, 30)
        .padding(.horizontal, 10)
    }
}

#Preview("Breaking News") {
    ArticleTextContent(
        content: NewsData.sampleBreakingNewsList[0].content,
        keywords: NewsData.sampleBreakingNewsList[0].keywords,
        quotes: NewsData.sampleBreakingNewsList[0].quotes,
        accent: Color.red
    )
}

#Preview("Regular News") {
    ArticleTextContent(
        content: NewsData.sampleNewsList[0].content,
        keywords: NewsData.sampleNewsList[0].keywords,
        quotes: NewsData.sampleBreakingNewsList[0].quotes,
        accent: Color.green
    )
}
