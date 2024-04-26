//
//  ProductService.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import Foundation
import BarcodeScanner

class ProductService {
    enum ProductServiceError: Error {
        case invalidURL
        case invalidResponse
        case noData
        case decodingError
    }

    func fetchProductDetails(for barcode: String, completion: @escaping (Result<Product, Error>) -> Void) {
        guard let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/\(barcode).json") else {
            completion(.failure(ProductServiceError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ProductServiceError.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(ProductServiceError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(Product.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(ProductServiceError.decodingError))
            }
        }.resume()
    }
}
