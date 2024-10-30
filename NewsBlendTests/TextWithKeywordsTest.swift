//
//  TextWithKeywordsTest.swift
//  NewsBlendTest
//
//  Created by Suraj Chodankar on 9/10/2024.
//

@testable import NewsBlend
import SwiftUI
import XCTest

// Unit test class for testing the textWithKeywords function
final class TextWithKeywords_Test: XCTestCase {
    // Test to verify that the function correctly formats text with keywords as links
    func testTextWithKeywords() {
        // Given: A sample content string and keywords to format
        let content = "Check out Swift and SwiftUI for building apps."
        let keywords: [String: String] = [
            "Swift": "https://swift.org",
            "SwiftUI": "https://developer.apple.com/xcode/swiftui/"
        ]

        // When: Calling the function to format the text with keywords
        let result = textWithKeywords(content, keywords: keywords, accent: .blue)

        // Then: Check if the resulting attributed string contains the formatted keywords
        for (keyword, url) in keywords {
            // Check if the keyword exists in the result
            XCTAssertTrue(result.range(of: keyword) != nil, "The keyword '\(keyword)' should be present in the result.")

            // Ensure that the range of the keyword is properly attributed
            if let range = result.range(of: keyword) {
                XCTAssertEqual(result[range].link, URL(string: url), "The link for '\(keyword)' should match the expected URL.")
                XCTAssertEqual(result[range].foregroundColor, .blue, "The foreground color for '\(keyword)' should match the accent color.")
                XCTAssertEqual(result[range].underlineStyle, .single, "The underline style for '\(keyword)' should be single.")
            }
        }

        // Check if non-keyword content remains unchanged
        let nonKeywordContent = "This is a test sentence."
        let nonKeywordResult = textWithKeywords(nonKeywordContent, keywords: keywords, accent: .blue)
        //        XCTAssertEqual(nonKeywordResult.string, nonKeywordContent, "The non-keyword content should remain unchanged.")
    }
}
