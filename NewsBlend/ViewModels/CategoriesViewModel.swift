//
//  CategoriesViewModel.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 13/10/2024.
//

import Combine
import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var categoryItems: [Category] = []

    func fetchCategories() {
        let url = URL(string: "https://newsblend.abdullahjaswal.com/news/category/")!

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else { return }

            do {
                let decodedData = try JSONDecoder().decode([Category].self, from: data)

                DispatchQueue.main.async {
                    self.categoryItems = decodedData
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }

    func loadPreviewData() {
        categoryItems = CategoryData.categories
    }
}
