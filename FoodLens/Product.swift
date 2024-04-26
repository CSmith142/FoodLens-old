import SwiftUI
import BarcodeScanner

struct Product: Identifiable, Decodable {
    var id = UUID() // Add an id property
    
    let name: String
    let brand: String
    let additives: [Additive]
    let nutritionInfo: NutritionInfo
    let awards: [Award]
    let barcode: String
    let imageURL: URL? // Make imageURL optional by using URL?
    let description: String

    var rating: Int {
        var product = self
        return product.calculateRating()
    }

    mutating func calculateRating() -> Int {
        let additiveRating = calculateAdditivesRating()
        let nutritionRating = calculateNutritionRating()
        return (additiveRating + nutritionRating) / 2
    }

    private func calculateAdditivesRating() -> Int {
        return Int.random(in: 0...100)
    }

    private func calculateNutritionRating() -> Int {
        return Int.random(in: 0...100)
    }
}
