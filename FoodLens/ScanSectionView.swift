//
//  ScanSectionView.swift
//  FoodLens
//
//  Created by Conor Smith on 18/04/2024.
//

import SwiftUI

struct ScanSection: View {
    @ObservedObject var viewModel = BarcodeScannerViewModel()

    var body: some View {
        VStack {
            // Display scanned barcode if available
            if let scannedBarcode = viewModel.scannedBarcode {
                Text("Scanned Barcode: \(scannedBarcode)")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
            }

            // BarcodeScannerView to scan barcodes
            BarcodeScannerView(scannedCode: $viewModel.scannedBarcode)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
