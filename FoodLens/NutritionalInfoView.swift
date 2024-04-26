//
//  NutritionalInfoView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//


import SwiftUI
import BarcodeScanner

struct NutritionItemView: View {
    let title: String
    let value: Double
    let symbol: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text("\(value, specifier: "%.1f") \(symbol)")
                .foregroundColor(nutritionColor(value))
        }
    }

    private func nutritionColor(_ value: Double) -> Color {
        // Customize color based on the nutritional value
        switch title {
        case "Protein":
            return proteinColor(value)
        case "Salt":
            return saltColor(value)
        case "Saturates":
            return fatColor(value)
        case "Sugars":
            return sugarColor(value)
        case "Energy":
            return energyColor(value)
        default:
            return .black
        }
    }

    private func proteinColor(_ value: Double) -> Color {
        // Add logic to determine color based on protein value
        // Example logic:
        return value >= 20.0 ? .green : .red
    }

    private func saltColor(_ value: Double) -> Color {
        // Add logic to determine color based on salt value
        // Example logic:
        return value <= 1.0 ? .green : .red
    }

    private func fatColor(_ value: Double) -> Color {
        // Add logic to determine color based on saturates value
        // Example logic:
        return value <= 10.0 ? .green : .red
    }

    private func sugarColor(_ value: Double) -> Color {
        // Add logic to determine color based on sugars value
        // Example logic:
        return value <= 5.0 ? .green : .red
    }

    private func energyColor(_ value: Double) -> Color {
        // Add logic to determine color based on energy value
        // Example logic:
        return value <= 1000.0 ? .green : .red
    }
}
