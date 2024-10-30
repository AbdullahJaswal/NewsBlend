//
//  RelativeDateFormatterTest.swift
//  NewsBlendTest
//
//  Created by Suraj Chodankar on 9/10/2024.
//

@testable import NewsBlend
import XCTest

// Unit test class for testing relative date formatting
final class RelativeDateFormatter_Test: XCTestCase {
    // Test to verify that the function correctly converts a given date to a relative date string
    func testGetRelativeDateTime() {
        // Given: A date that is 1 day in the past relative to the current date
        let oneDayAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        // Common possible outputs across locales
        let expectedOutputs = ["yesterday", "1 day ago"]

        // When: Calling the function with the date from 1 day ago
        let result = getRelativeDateTime(from: oneDayAgo)

        // Then: Assert that the result contains one of the possible valid descriptions
        let isValid = expectedOutputs.contains { result.contains($0) }
        XCTAssertTrue(isValid, "The relative date string should describe the date as 'yesterday' or '1 day ago'.")
    }
}
