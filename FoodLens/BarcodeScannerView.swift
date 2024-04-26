// BarcodeScannerView.swift
import SwiftUI
import AVFoundation

//struct BarcodeScannerView: View {
   // @ObservedObject var viewModel: BarcodeScannerViewModel
   // @State private var isScanning = false

    var body: some View {
        VStack(alignment: .center, spacing: 0) { // Specify alignment and spacing
            // Camera Preview
            AVCameraPreview(scannedCode: $viewModel.scannedBarcode, viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(Color.black)
            
            // Start/Stop Scanning Button
            Button(action: {
                if isScanning {
                    viewModel.stopScanning()
                } else {
                    viewModel.startScanning()
                }
                isScanning.toggle()
            }) {
                Text(isScanning ? "Stop Scanning" : "Start Scanning")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // Display scanned barcode if available
            if let scannedBarcode = viewModel.scannedBarcode {
                Text("Scanned Barcode: \(scannedBarcode)")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
            }
        }
        .onAppear {
            viewModel.startScanning() // Start scanning when the view appears
            isScanning = true
        }
        .onDisappear {
            viewModel.stopScanning() // Stop scanning when the view disappears
            isScanning = false
        }
    }
}
