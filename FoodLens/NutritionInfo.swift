//
//  NutritionInfo.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation
import BarcodeScanner

struct NutritionInfo: Decodable {
    let protein: Double
    let salt: Double
    let saturates: Double
    let sugars: Double
    let energy: Double
    // Add more properties as needed

    init(protein: Double, salt: Double, saturates: Double, sugars: Double, energy: Double) {
        self.protein = protein
        self.salt = salt
        self.saturates = saturates
        self.sugars = sugars
        self.energy = energy
    }
}
