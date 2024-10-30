//
//  TextWithKeywords.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 4/10/2024.
//

import Foundation
import SwiftUI

func textWithKeywords(
    _ content: String,
    keywords: [String: String],
    accent: Color
) -> AttributedString {
    var attributedString = AttributedString(content)

    for (keyword, url) in keywords {
        if let range = attributedString.range(of: keyword) {
            attributedString[range].link = URL(string: url)
            attributedString[range].foregroundColor = accent
            attributedString[range].underlineStyle = .single
        }
    }

    return attributedString
}
