//
//  SearchView.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

// SearchView.swift

import SwiftUI
import BarcodeScanner


struct SearchView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Product] = []

    var body: some View {
        VStack {
            // Search Bar
            Text("Search")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            TextField("Search for a product", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: searchText) { newValue in
                    // Perform search operation here based on the newValue
                    searchResults = sampleProducts.filter { $0.name.lowercased().contains(newValue.lowercased()) }
                }

            // Display search results
            List(searchResults) { product in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        if let imageURL = product.imageURL {
                            AsyncImage(url: imageURL) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                default:
                                    Image(systemName: "photo") // Placeholder image
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .frame(width: 50, height: 50) // Apply frame to AsyncImage
                            .cornerRadius(8)
                        } else {
                            Image(systemName: "photo") // Placeholder image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50) // Apply frame to Image
                                .cornerRadius(8)
                        }

                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Text(product.brand)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding()
        }
        .padding(.horizontal, 20)
    }
}
