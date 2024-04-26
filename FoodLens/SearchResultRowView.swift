//
//  SearchResultRowView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct SearchResultRowView: View {
    let product: Product

    var body: some View {
        HStack(spacing: 10) {
            // Product Image
            AsyncImage(url: product.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                default:
                    PlaceholderImageView()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                }
            }
            
            VStack(alignment: .leading) {
                // Product Name
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                // Brand
                Text("Brand: \(product.brand)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Color-coded Rating
                RatingShapeView(rating: product.rating)
                
                // Numerical Rating
                Text("Rating: \(product.rating)/100")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
    }
}
