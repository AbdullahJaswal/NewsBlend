//
//  TabBarView.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 31/8/2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tabs = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tabs.home)

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tabs.search)

            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }
                .tag(Tabs.bookmarks)
        }
    }
}

#Preview {
    TabBarView()
}
