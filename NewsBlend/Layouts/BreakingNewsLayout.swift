//
//  BreakingNewsLayout.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 26/8/2024.
//

import SwiftUI

struct BreakingNewsLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews _: Subviews, cache _: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) {
        guard subviews.count == 2, bounds.width > 0, bounds.height > 0 else { return }

        let imageView = subviews[0]
        let cardView = subviews[1]

        // Card
        let cardSize = cardView.sizeThatFits(ProposedViewSize(width: bounds.width, height: nil))

        // Limit the card expansion to 70%
        let cardHeight = min(cardSize.height, bounds.height * 0.7)

        cardView.place(
            at: CGPoint(x: bounds.minX, y: bounds.maxY - cardHeight),
            anchor: .topLeading,
            proposal: ProposedViewSize(width: bounds.width, height: cardHeight)
        )

        // Image
        let imageHeight = bounds.height - cardHeight

        imageView.place(
            at: CGPoint(x: bounds.minX, y: bounds.minY),
            anchor: .topLeading,
            proposal: ProposedViewSize(width: bounds.width, height: imageHeight)
        )
    }
}
