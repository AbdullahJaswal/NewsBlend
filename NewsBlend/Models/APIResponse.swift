//
//  APIResponse.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 2/10/2024.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]
}
