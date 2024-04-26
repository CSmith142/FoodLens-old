//
//  RatingView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct RatingView: View {
    let rating: Int

    var body: some View {
        HStack(spacing: 4) {
            Text("Rating:")
                .font(.caption)
                .foregroundColor(.secondary)

            RatingShapeView(rating: rating)
        }
    }
}
