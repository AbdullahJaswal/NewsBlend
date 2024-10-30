//
//  IndividualNewsTileView.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 31/8/2024.
//

import SwiftUI

struct IndividualNewsTileView: View {
    var filteredNews: News

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: filteredNews.images.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(height: 200)
            .clipped()
            .cornerRadius(10.0)

            Text(filteredNews.title)
                .font(.headline)
                .padding()
                .background(Color.black.opacity(0.6))
                .foregroundColor(.white)
        }
    }
}
