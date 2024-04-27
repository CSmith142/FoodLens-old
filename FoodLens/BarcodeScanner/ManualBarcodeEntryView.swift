import SwiftUI
import BarcodeScanner

struct ManualBarcodeEntryView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @State private var manualBarcode: String = ""

    var body: some View {
        VStack {
            Text("Enter Barcode Manually")
                .font(.title)
                .padding()

            TextField("Enter Barcode", text: $manualBarcode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Submit") {
                // Call the function to add the manually entered barcode to history
                historyViewModel.addScannedBarcode(manualBarcode)

                // Clear the text field after submission
                manualBarcode = ""
            }
            .padding()
        }
        .padding()
    }
}
