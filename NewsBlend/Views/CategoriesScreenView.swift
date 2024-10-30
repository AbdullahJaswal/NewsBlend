//
//  CategoriesScreenView.swift
//  NewsBlend
//
//  Created by Suraj Chodankar on 24/8/2024.
//

import SwiftUI

struct CategoriesScreenView: View {
    @StateObject private var viewModel = CategoriesViewModel()

    let categories: [String: (icon: String, color: Color)] = [
        "Politics": ("building.columns", .blue),
        "Economy": ("dollarsign.arrow.circlepath", .teal),
        "Technology": ("cpu", .purple),
        "Culture": ("theatermasks", .orange),
        "Crisis": ("exclamationmark.triangle", .red),
        "Health": ("cross.case", .pink),
        "Science": ("atom", .yellow),
        "Sports": ("football", .brown),
        "Environment": ("leaf", .green),
        "Education": ("graduationcap", .indigo)
    ]

    // 2 cloumns
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.categoryItems, id: \.slug) { categoryItem in
                        let icon = categories[categoryItem.name]?.icon
                        let color = categories[categoryItem.name]?.color

                        NavigationLink(
                            value: categoryItem
                        ) {
                            CategoriesTileView(
                                category: categoryItem.name,
                                categoryColour: color ?? nil,
                                icon: icon ?? nil
                            )
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(for: Category.self) { selectedCategory in
                let icon = categories[selectedCategory.name]?.icon
                let color = categories[selectedCategory.name]?.color

                IndividualCategoriesHomeView(
                    category: selectedCategory,
                    categoryIcon: icon ?? nil,
                    categoryColor: color ?? nil
                )
            }
        }
        .onAppear {
            if isRunningInPreview() {
                viewModel.loadPreviewData()
            } else {
                viewModel.fetchCategories()
            }
        }
    }
}

#Preview {
    CategoriesScreenView()
}
