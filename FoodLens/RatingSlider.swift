//
//  RatingSlider.swift
//  FoodLens
//
//  Created by Conor Smith on 21/04/2024.
//

import SwiftUI
import Foundation

struct RatingSlider: View {
    @State private var rating: Int = 0
    let product: ScannedProduct
    let viewModel: HistoryViewModel

    var body: some View {
        HStack {
            Text("Rate: \(rating)")
            Slider(value: Binding<Double>(
                get: { Double(rating) }, // Cast Int to Double
                set: { newValue in
                    rating = Int(newValue) // Cast Double back to Int
                    viewModel.setUserRating(for: product, rating: rating)
                }
            ), in: 0...5, step: 1)
        }
    }
}
