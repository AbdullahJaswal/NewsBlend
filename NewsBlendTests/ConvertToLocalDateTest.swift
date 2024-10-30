//
//  ConvertToLocalDateTest.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 13/10/2024.
//

@testable import NewsBlend
import XCTest

// Unit testing class for converting a string to a local date
final class ConvertToLocalDate_Test: XCTestCase {
    // Test to verify that when the function receives a valid date string, it correctly converts it to a local Date object.
    func testConvertToLocalDate_ValidDate() {
        // Given: A valid date string in the ISO 8601 format
        let dateString = "2024-10-01T12:34:56Z"

        // Expected components of the date after conversion
        // (year: 2024, month: October, day: 1, time: 12:34:56)
        let expectedComponents = DateComponents(year: 2024, month: 10, day: 1, hour: 12, minute: 34, second: 56)
        let calendar = Calendar.current

        // When: Calling the function to convert the date string
        let result = convertToLocalDate(from: dateString)

        // Then: Check if the conversion result is not nil
        XCTAssertNotNil(result, "The date should not be nil for a valid date string.")

        // Then: If the result is not nil, check if the components of the date match the expected values
        if let result {
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: result)
            XCTAssertEqual(components, expectedComponents, "The converted date should match the expected components.")
        }
    }

    // Test to verify that when the function receives an invalid date string, it should return nil.
    func testConvertToLocalDate_InvalidDate() {
        // Given: An invalid date string that does not match the expected format
        let invalidDateString = "This is an Invalid Date String"

        // When: Attempting to convert the invalid date string
        let result = convertToLocalDate(from: invalidDateString)

        // Then: The result should be nil because the date string is invalid
        XCTAssertNil(result, "The result should be nil for an invalid date string.")
    }

    // Test to verify that when the function receives an empty string, it should return nil as there is no valid date to convert.
    func testConvertToLocalDate_EmptyDate() throws {
        // Given: An empty string input
        let emptyDateString = ""

        // When: Attempting to convert the empty string
        let result = convertToLocalDate(from: emptyDateString)

        // Then: The result should be nil because the date string is empty
        XCTAssertNil(result, "The result should be nil for an empty date string.")
    }
}
