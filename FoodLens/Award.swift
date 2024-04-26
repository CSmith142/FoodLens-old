//
//  Award.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation
import BarcodeScanner

enum Award: String, Decodable {
    case lowCarbonFootprint = "Low Carbon Footprint"
    case organic = "Organic"
    case freeFromAdditives = "Free from Additives"
    case irishMade = "Irish Made"
    case betterPackaging = "Better Packaging"
    case animalWelfare = "Animal Welfare"
}
