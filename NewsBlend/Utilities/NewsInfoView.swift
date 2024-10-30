//
//  NewsInfoView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 31/8/2024.
//

import SwiftUI

struct NewsInfoView: View {
    let newsItem: News
    let accent: Color

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                ForEach(newsItem.categories.prefix(2), id: \.slug) { category in
                    Text(category.name)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(accent)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                }

                // If the news belongs to more than 2 categories
                if newsItem.categories.count > 2 {
                    Text("++")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(accent)
                }
            }

            Spacer()

            Label {
                Text(getRelativeDateTime(from: newsItem.published_at))
                    .font(.caption)
                    .fontWeight(.semibold)
            } icon: {
                Image(systemName: "stopwatch.fill")
                    .foregroundColor(accent)
                    .imageScale(.medium)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
