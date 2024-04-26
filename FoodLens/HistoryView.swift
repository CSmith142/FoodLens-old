import SwiftUI
import BarcodeScanner

struct HistoryView: View {
    @ObservedObject var viewModel: HistoryViewModel

    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
            
            // Display scanned products with ratings
            List {
                ForEach(viewModel.scannedProducts, id: \.id) { product in
                    HistoryRowView(product: product)
                }
            }
            .padding()
            
            Divider()
            
            // Display favorites with ratings
            Text("Favorites")
                .font(.title)
                .padding()
            
            List {
                ForEach(viewModel.favorites, id: \.id) { product in
                    HistoryRowView(product: product)
                }
            }
            .padding()
        }
    }
}
