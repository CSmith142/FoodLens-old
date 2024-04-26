//
//  AdditivesView.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import SwiftUI
import Foundation
import BarcodeScanner

struct AdditiveItemView: View {
    let additive: Additive

    var body: some View {
        HStack {
            Text(additive.name)
            Spacer()
            Text("Risk Level: \(additive.riskLevel.rawValue)")
        }
        .foregroundColor(colorForRiskLevel(additive.riskLevel))
    }

    private func colorForRiskLevel(_ riskLevel: RiskLevel) -> Color {
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
