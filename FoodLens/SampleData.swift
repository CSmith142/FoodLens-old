//
//  SampleData.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import Foundation
import BarcodeScanner

let sampleProducts: [Product] = [
    Product(
        name: "Zartes Blätterteiggebäck",
        brand: "Duc de Coeur",
        additives: [],
        nutritionInfo: NutritionInfo(
            protein: 10.0,
            salt: 5.0,
            saturates: 3.0,
            sugars: 15.0,
            energy: 200.0
        ),
        awards: [],
        barcode: "4056489818526",
        imageURL: URL(string: "https://images.openfoodfacts.org/images/products/405/648/981/8526/front_de.3.400.jpg")!,
        description: "Pastery"
    ),
    // Add more sample products here
]
