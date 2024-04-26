//
//  OverviewView.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

// OverviewView.swift

import SwiftUI
import BarcodeScanner

struct OverviewView: View {
    @StateObject var viewModel = OverviewViewModel() // Inject the view model

    var body: some View {
        // Implement OverviewView UI
        Text("Overview View")
    }
}

