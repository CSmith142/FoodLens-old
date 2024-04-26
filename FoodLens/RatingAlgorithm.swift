//
//  RatingAlgorithm.swift
//  FoodLens
//
//  Created by Conor Smith on 21/04/2024.
//

import Foundation
import SwiftUI
import BarcodeScanner


//class RatingAlgorithm {
    //static let shared = RatingAlgorithm() // Singleton instance
    
    // Define weightage for each nutritional component
    let calorieWeightage = 0.2
    let proteinWeightage = 0.2
    let sugarWeightage = 0.2
    let saturatedFatWeightage = 0.2
    let fiberWeightage = 0.2
    
    // Function to calculate rating based on nutritional values
    func calculateRating(for product: ScannedProduct) -> Int {
        // Get nutritional values from the scanned product
        let calories = product.calories ?? 0
        let protein = product.protein ?? 0
        let sugar = product.sugar ?? 0
        let saturatedFat = product.saturatedFat ?? 0
        let fiber = product.fiber ?? 0
        
        // Calculate score for each nutritional component
        let calorieScore = normalize(calories) * calorieWeightage
        let proteinScore = normalize(protein) * proteinWeightage
        let sugarScore = normalize(sugar) * sugarWeightage
        let saturatedFatScore = normalize(saturatedFat) * saturatedFatWeightage
        let fiberScore = normalize(fiber) * fiberWeightage
        
        // Calculate total score
        let totalScore = calorieScore + proteinScore + sugarScore + saturatedFatScore + fiberScore
        
        // Assign rating based on total score
        if totalScore >= 90 {
            return Rating.superfood.rawValue
        } else if totalScore >= 70 {
            return Rating.excellent.rawValue
        } else if totalScore >= 50 {
            return Rating.fair.rawValue
        } else if totalScore >= 25 {
            return Rating.poor.rawValue
        } else {
            return Rating.bad.rawValue
        }
    }
    
    // Normalize a value to a scale of 0 to 100
    private func normalize(_ value: Double) -> Double {
        // Normalize value to a scale of 0 to 100
        let maxValue = 100.0 // Define maximum value for normalization
        let normalizedValue = (value / maxValue) * 100
        return normalizedValue
    }

