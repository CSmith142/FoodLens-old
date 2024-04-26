//
//  FoodLensApp.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

import SwiftUI
import AVFoundation
import BarcodeScanner


struct FoodLensApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabbedContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
