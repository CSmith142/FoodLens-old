import AVFoundation
import UIKit

class CameraViewModel: NSObject, ObservableObject {
    let session = AVCaptureSession()
    @Published var scannedBarcode: String?
    var isUsingFrontFacingCamera = false
    
    override init() {
        super.init()
        setupCaptureSession()
    }
    
    private func setupCaptureSession() {
        var _: NSError?
        let sessionPreset: AVCaptureSession.Preset = UIDevice.current.userInterfaceIdiom == .phone ? .vga640x480 : .photo
        session.sessionPreset = sessionPreset
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: isUsingFrontFacingCamera ? .front : .back),
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

extension CameraViewModel: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let barcode = metadataObject.stringValue else {
            return
        }
        
        scannedBarcode = barcode
    }
}
