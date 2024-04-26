import SwiftUI
import BarcodeScanner

struct HistoryRowView: View {
    let product: ScannedProduct

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                Text(product.brand)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(product.userRating ?? 0)") // Display user rating
        }
        .padding()
    }
}
