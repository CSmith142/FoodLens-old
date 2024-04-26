//
//  SearchResultsView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct SearchResultsView: View {
    @Binding var searchResults: [Product]
    @State private var sortOption: SortOption = .name

    enum SortOption {
        case name
        case rating
        case brand
        // Add more sorting options as needed
    }

    var sortedResults: [Product] {
        switch sortOption {
        case .name:
            return searchResults.sorted { $0.name < $1.name }
        case .rating:
            return searchResults.sorted { $0.rating > $1.rating }
        case .brand:
            return searchResults.sorted { $0.brand < $1.brand }
        }
    }

    var body: some View {
        VStack {
            // Sorting Picker
            Picker("Sort By", selection: $sortOption) {
                Text("Name").tag(SortOption.name)
                Text("Rating").tag(SortOption.rating)
                Text("Brand").tag(SortOption.brand)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Display sorted search results
            List(sortedResults) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    SearchResultRowView(product: product)
                }
            }
        }
    }
}
