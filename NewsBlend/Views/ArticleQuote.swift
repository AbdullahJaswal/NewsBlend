//
//  ArticleQuote.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 6/10/2024.
//

import SwiftUI

struct ArticleQuote: View {
    let quote: Quote
    let accent: Color
    let showQuote: Bool

    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            if showQuote {
                Image(systemName: "quote.opening")
                    .scaleEffect(1.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(accent)
                    .padding(.leading, 8)

                Text("\"\(quote.quote)\"")
                    .font(.subheadline)
                    .fontDesign(.serif)
                    .italic()
                    .foregroundStyle(.foreground.opacity(0.75))
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(quote.name)
                    .font(.caption2)
                    .fontDesign(.serif)
                    .bold()
                    .foregroundStyle(.foreground.opacity(0.8))
                    .frame(alignment: .trailing)
            } else {
                Spacer(minLength: 40)
            }
        }
    }
}

#Preview("Breaking News") {
    ArticleQuote(
        quote: NewsData.sampleBreakingNewsList[0].quotes[0],
        accent: .red,
        showQuote: true
    )
}

#Preview("Regular News") {
    ArticleQuote(
        quote: NewsData.sampleNewsList[0].quotes[0],
        accent: .green,
        showQuote: true
    )
}
