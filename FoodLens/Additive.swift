//
//  Additive.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation
import BarcodeScanner

struct Additive: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let riskLevel: RiskLevel // Enum: low, medium, high
    let description: String // Description of the additive
    // Add more properties as needed
}
