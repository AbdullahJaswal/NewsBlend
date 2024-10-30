//
//  Tabs.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 31/8/2024.
//

import Foundation

enum Tabs: Equatable, Hashable, Identifiable {
    var id: Self { self }
    case home
    case search
    case settings
}
