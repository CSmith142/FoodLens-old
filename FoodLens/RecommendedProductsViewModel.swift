import Foundation
import BarcodeScanner

class RecommendedProductsViewModel: ObservableObject {
    @Published var recommendedProducts: [Product] = []
    
    // Fetch recommended products
    func fetchRecommendedProducts() {
        // Replace this URL with your actual API endpoint
        guard let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/4056489818526.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching recommended products: \(error)")
                return
            }
            
            // Check if response is received
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            // Check if data is received
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                // Decode received data into an array of Product objects
                let decoder = JSONDecoder()
                let products = try decoder.decode([Product].self, from: data)
                
                // Update recommendedProducts on the main queue
                DispatchQueue.main.async {
                    self.recommendedProducts = products
                }
            } catch {
                print("Error decoding recommended products response: \(error)")
            }
        }.resume()
    }
}
