import SwiftUI
import BarcodeScanner

struct RecommendedProductsView: View {
    @ObservedObject var viewModel: RecommendedProductsViewModel

    var body: some View {
        VStack {
            if viewModel.recommendedProducts.isEmpty {
                Text("Loading...")
            } else {
                List(viewModel.recommendedProducts) { product in
                    Text(product.name)
                }
            }
        }
        .onAppear {
            viewModel.fetchRecommendedProducts()
        }
    }
}
