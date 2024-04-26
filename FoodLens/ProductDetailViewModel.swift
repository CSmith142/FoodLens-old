//
//  ProductDetailViewModel.swift
//  FoodLens
//
//  Created by Conor Smith on 14/04/2024.
//

import Foundation
import BarcodeScanner

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product

    init(product: Product) {
        self.product = product
    }

    func fetchProductDetails() {
        guard let url = URL(string: "https://api.example.com/product/details/\(product.id)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching product details:", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid HTTP response")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async {
                    self.product = decodedData
                }
            } catch {
                print("Error decoding product details:", error)
            }
        }.resume()
    }
}
