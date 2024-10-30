//
//  KeyPointsView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

import SwiftUI

struct KeyPointsView: View {
    let points: [String: String]
    let accent: Color

    var body: some View {
        VStack(alignment: .leading) {
            Label {
                Text("Key Points")
                    .font(.title3)
                    .fontWeight(.bold)
            } icon: {
                Image(systemName: "star.circle.fill")
                    .foregroundColor(accent)
                    .imageScale(.large)
            }

            ForEach(Array(points.keys.sorted()), id: \.self) { key in
                Label {
                    Text(points[key]!)
                        .font(.footnote)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(accent)
                }.padding(.horizontal, 9)
            }
        }
    }
}

#Preview("Breaking News") {
    KeyPointsView(
        points: NewsData.sampleBreakingNewsList[0].points,
        accent: Color.red
    )
}

#Preview("Regular News") {
    KeyPointsView(
        points: NewsData.sampleNewsList[0].points,
        accent: Color.green
    )
}
