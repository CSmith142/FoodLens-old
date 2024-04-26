//
//  ProductDetailView.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

import SwiftUI
import BarcodeScanner

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Product Image
            AsyncImage(url: product.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    PlaceholderImageView()
                }
            }
            .frame(maxHeight: 200)
            .cornerRadius(10)
            
            // Product Name
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            
            // Brand
            Text("Brand: \(product.brand)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Color-coded Rating
            HStack(spacing: 4) {
                Text("Rating:")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                RatingShapeView(rating: product.rating)
            }

            // Numerical Rating
            Text("Rating: \(product.rating)/100")
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Nutritional Information
            VStack(alignment: .leading, spacing: 8) {
                Text("Nutritional Information")
                    .font(.title2)
                    .fontWeight(.bold)
                
                NutritionalInfoView(nutritionInfo: product.nutritionInfo)
            }

            // Additives
            VStack(alignment: .leading, spacing: 8) {
                Text("Additives")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(product.additives) { additive in
                    AdditiveView(additive: additive)
                }
            }
        }
        .padding()
    }
}
