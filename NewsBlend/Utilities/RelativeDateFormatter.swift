//
//  RelativeDateFormatter.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 31/8/2024.
//

import Foundation

func getRelativeDateTime(from date: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full

    return formatter.localizedString(for: date, relativeTo: Date.now)
}
