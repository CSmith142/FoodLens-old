//
//  PlaceholderImageView.swift
//  FoodLens
//
//  Created by Conor Smith on 22/04/2024.
//

import Foundation
import SwiftUI
import BarcodeScanner

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo") // You can replace "photo" with the name of your placeholder image asset
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray) // Customize the color of the placeholder image
    }
}
