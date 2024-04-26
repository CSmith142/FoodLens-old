//
//  CameraView.swift
//  FoodLens
//
//  Created by Conor Smith on 23/04/2024.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    let session: AVCaptureSession

    init(session: AVCaptureSession) {
        self.session = session
    }

    var body: some View {
        PreviewView(session: session)
            .edgesIgnoringSafeArea(.all)
    }
}

struct PreviewView: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let layer = AVCaptureVideoPreviewLayer(session: session)
        layer.videoGravity = .resizeAspectFill
        layer.frame = view.layer.bounds
        view.layer.addSublayer(layer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
