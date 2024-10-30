//
//  ConvertToLocalDate.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 1/10/2024.
//

import Foundation

func convertToLocalDate(from dateString: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    formatter.timeZone = TimeZone.current
    formatter.locale = Locale(identifier: "en_US_POSIX")

    if let date = formatter.date(from: dateString) {
        return date
    } else {
        return nil
    }
}
