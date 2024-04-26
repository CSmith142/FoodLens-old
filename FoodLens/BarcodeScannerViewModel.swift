import SwiftUI
import AVFoundation

class BarcodeScannerViewModel: NSObject, ObservableObject {
    let session = AVCaptureSession()
    @Published var scannedBarcode: String?
    let historyViewModel: HistoryViewModel // Add reference to HistoryViewModel
    
    init(historyViewModel: HistoryViewModel) {
        self.historyViewModel = historyViewModel
        super.init()
        setupCaptureSession()
    }
    
    private func setupCaptureSession() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }

        if session.canAddInput(input) {
            session.addInput(input)
        }

        let metadataOutput = AVCaptureMetadataOutput()
        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417] // Add more types as needed
        }
    }

    func startScanning() {
        session.startRunning()
    }

    func stopScanning() {
        session.stopRunning()
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate

extension BarcodeScannerViewModel: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let barcode = metadataObject.stringValue else {
            return
        }
        
        // Pass the scanned barcode to the history view model
        historyViewModel.addScannedBarcode(barcode)
        
        // Update the scannedBarcode property
        scannedBarcode = barcode
    }
}
