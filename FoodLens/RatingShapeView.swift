//
//  RatingShapeView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct RatingShapeView: View {
    let rating: Int

    var body: some View {
        let color: Color
        let text: String

        switch rating {
        case 0..<26:
            color = .red
            text = "Poor"
        case 26..<51:
            color = .orange
            text = "Fair"
        case 51..<76:
            color = .yellow
            text = "Good"
        default:
            color = .green
            text = "Excellent"
        }

        return AnyView(
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(color)
                    .frame(width: 50, height: 20)
                Text(text)
                    .font(.caption)
            }
        )
    }
}
