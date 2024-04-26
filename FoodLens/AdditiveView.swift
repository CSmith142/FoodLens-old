//
//  AdditiveView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import SwiftUI
import BarcodeScanner

struct AdditiveView: View {
    let additive: Additive

    var body: some View {
        HStack {
            Text("Name: \(additive.name)")
                .font(.headline)
            Spacer()
            Text("Risk Level: \(additive.riskLevel.rawValue)") // Use the rawValue of the enum
                .foregroundColor(additiveColor(additive.riskLevel)) // Pass the enum directly
        }
    }

    private func additiveColor(_ riskLevel: RiskLevel) -> Color {
        // Customize color based on the risk level
        switch riskLevel {
        case .high:
            return .red
        case .moderate:
            return .orange
        case .low:
            return .green
        }
    }
}
