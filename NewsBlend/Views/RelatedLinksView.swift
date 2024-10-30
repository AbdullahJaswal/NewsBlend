//
//  RelatedLinksView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct RelatedLinksView: View {
    let urls: [String]
    let accent: Color

    var body: some View {
        VStack(alignment: .leading) {
            Label {
                Text("Related Links")
                    .font(.title3)
                    .fontWeight(.bold)
            } icon: {
                Image(systemName: "link.circle.fill")
                    .foregroundColor(accent)
                    .imageScale(.large)
            }.padding(.bottom, 4)

            ForEach(urls, id: \.self) { urlString in
                if let url = URL(string: urlString) {
                    Link(destination: url) {
                        Label {
                            Text(urlString)
                                .font(.caption)
                                .foregroundColor(accent)
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "link")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(accent)
                        }
                        .labelStyle(CenteredLabelStyle())
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
                }
            }
        }
    }
}

#Preview("Breaking News") {
    RelatedLinksView(
        urls: NewsData.sampleBreakingNewsList[0].urls,
        accent: Color.red
    )
}

#Preview("Regular News") {
    RelatedLinksView(
        urls: NewsData.sampleNewsList[0].urls,
        accent: Color.green
    )
}
