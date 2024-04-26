//
//  NutritionInfoView.swift
//  FoodLens
//
//  Created by Conor Smith on 18/04/2024.
//

import SwiftUI
import BarcodeScanner

struct NutritionalInfoView: View {
    let nutritionInfo: NutritionInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NutritionInfoRowView(title: "Energy", value: "\(nutritionInfo.energy) kcal")
            NutritionInfoRowView(title: "Protein", value: "\(nutritionInfo.protein) g")
            NutritionInfoRowView(title: "Salt", value: "\(nutritionInfo.salt) g")
            NutritionInfoRowView(title: "Saturates", value: "\(nutritionInfo.saturates) g")
            NutritionInfoRowView(title: "Sugars", value: "\(nutritionInfo.sugars) g")
            // Add more rows for other nutritional information as needed
        }
    }
}

struct NutritionInfoRowView: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}
