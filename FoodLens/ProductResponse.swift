//
//  ProductResponse.swift
//  FoodLens
//
//  Created by Conor Smith on 18/04/2024.
//

import Foundation

struct ProductResponse: Codable {
    let product: Product?
}

struct Product: Codable {
    // Define properties based on the JSON structure of your API response
    // Example properties:
    let name: String
    let brand: String
    let additives: [Additive]
    let nutritionInfo: NutritionInfo
    let awards: [Award]
    let barcode: String
    let imageURL: URL
    let description: String
}
