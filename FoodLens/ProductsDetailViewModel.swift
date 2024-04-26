//
//  ProductsDetailViewModel.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    
    // Add more properties and methods as needed
    
    init(product: Product) {
        self.product = product
        // Initialize other properties or perform setup
    }
}
