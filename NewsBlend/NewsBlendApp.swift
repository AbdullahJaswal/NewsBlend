//
//  NewsBlendApp.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 15/8/2024.
//

import SwiftData
import SwiftUI

@main
struct NewsBlendApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fontDesign(.rounded)
                .accentColor(.yellow)
        }
        .modelContainer(for: NewsDataModel.self)
    }
}
