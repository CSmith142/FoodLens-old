//
//  FavouritesViewModel.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation
import BarcodeScanner

class FavoritesViewModel: ObservableObject {
    @Published var favoriteProducts: [Product] = []
    // Add more properties and methods as needed
    
    func addFavorite(product: Product) {
        // Implement logic to add a product to favorites
    }
    
    func removeFavorite(product: Product) {
        // Implement logic to remove a product from favorites
    }
    
    // Implement additional functionality as needed
}
