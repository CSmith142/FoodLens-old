//
//  NavigationLink.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct ProductView: View {
    let product: Product

    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product)) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Product Name: \(product.name)")
                Text("Brand: \(product.brand)")
            }
            .padding()
        }
    }
}
