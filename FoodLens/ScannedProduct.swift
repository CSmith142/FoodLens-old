//
//  ScannedProduct.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

import Foundation
import BarcodeScanner

class ScannedProduct: Identifiable {
    let id: UUID
    let name: String
    let brand: String
    var userRating: Int?
    var calories: Double?
    var protein: Double?
    var sugar: Double?
    var saturatedFat: Double?
    var fiber: Double?

    // Initializer to initialize all properties
    init(id: UUID, name: String, brand: String, userRating: Int?, calories: Double?, protein: Double?, sugar: Double?, saturatedFat: Double?, fiber: Double?) {
        self.id = id
        self.name = name
        self.brand = brand
        self.userRating = userRating
        self.calories = calories
        self.protein = protein
        self.sugar = sugar
        self.saturatedFat = saturatedFat
        self.fiber = fiber
    }
}
