//
//  NutritionItemView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//


import SwiftUI

struct NutritionalInfoView: View {
    let nutritionInfo: NutritionInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NutritionItemView(title: "Energy", value: nutritionInfo.energy, symbol: "kcal")
            NutritionItemView(title: "Protein", value: nutritionInfo.protein, symbol: "g")
            NutritionItemView(title: "Salt", value: nutritionInfo.salt, symbol: "g")
            NutritionItemView(title: "Saturates", value: nutritionInfo.saturates, symbol: "g")
            NutritionItemView(title: "Sugars", value: nutritionInfo.sugars, symbol: "g")
            // Add more rows for other nutritional information as needed
        }
    }
}
