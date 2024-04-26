//
//  ScannerViewModel.swift
//  FoodLens
//
//  Created by Conor Smith on 24/04/2024.
//

import SwiftUI
import AVFoundation
import BarcodeScanner

class ScannerViewModel: NSObject, ObservableObject {
    @Published var scannedCode: String?
    private let session = AVCaptureSession()
    
    override init() {
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

extension ScannerViewModel: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let barcode = metadataObject.stringValue else {
            return
        }
        
        // Update the scanned code
        scannedCode = barcode
    }
}
