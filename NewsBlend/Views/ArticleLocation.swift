//
//  ArticleLocation.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 4/10/2024.
//

import MapKit
import SwiftUI

struct ArticleLocation: View {
    let location: Location

    let markerIcon: String
    let markerColor: Color

    init(location: Location, sentiment: Sentiment, is_breaking_news: Bool) {
        self.location = location

        switch (is_breaking_news, sentiment) {
        case (true, _):
            markerIcon = "exclamationmark.circle.fill"
            markerColor = Color.red
        case (false, .negative):
            markerIcon = "newspaper.circle.fill"
            markerColor = Color.orange
        case (false, .positive):
            markerIcon = "newspaper.circle.fill"
            markerColor = Color.green
        default:
            markerIcon = "newspaper.circle.fill"
            markerColor = Color.blue
        }
    }

    var body: some View {
        Map {
            MapCircle(
                center: CLLocationCoordinate2D(
                    latitude: location.latitude,
                    longitude: location.longitude
                ),
                radius: CLLocationDistance(30000)
            )
            .foregroundStyle(markerColor.opacity(0.25))
            .mapOverlayLevel(level: .aboveRoads)

            Annotation(
                location.city,
                coordinate: CLLocationCoordinate2D(
                    latitude: location.latitude,
                    longitude: location.longitude
                )
            ) {
                Image(systemName: markerIcon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(markerColor)
                    .background(Circle().fill(Color.white))
                    .clipShape(Circle())
            }
            .mapOverlayLevel(level: .aboveRoads)
        }
        .frame(height: 300)
        .cornerRadius(10)
    }
}

#Preview("Breaking News") {
    ArticleLocation(
        location: NewsData.sampleBreakingNewsList[0].location!,
        sentiment: NewsData.sampleBreakingNewsList[0].sentiment,
        is_breaking_news: NewsData.sampleBreakingNewsList[0].is_breaking_news
    )
}

#Preview("Regular News") {
    ArticleLocation(
        location: NewsData.sampleNewsList[0].location!,
        sentiment: NewsData.sampleNewsList[0].sentiment,
        is_breaking_news: NewsData.sampleNewsList[0].is_breaking_news
    )
}
