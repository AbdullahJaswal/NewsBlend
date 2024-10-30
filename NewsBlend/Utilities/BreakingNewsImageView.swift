//
//  BreakingNewsImageView.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 31/8/2024.
//

import SwiftUI

struct BreakingNewsImageView: View {
    let newsItem: News

    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: newsItem.images.first ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .overlay(
                            // Darker on top
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                                startPoint: .top,
                                endPoint: .center
                            )
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        )
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
