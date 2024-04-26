//
//  FileHelper.swift
//  FoodLens
//
//  Created by Conor Smith on 25/04/2024.
//

import Foundation
import BarcodeScanner

// Define the file URL here
let fileURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first?.appendingPathComponent("restorecount.plist")

// Check if the file exists
func checkFile() {
    guard let fileURL = fileURL else {
        print("File URL is nil.")
        return
    }
    
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: fileURL.path) {
        print("File exists at the specified location.")
    } else {
        print("File does not exist at the specified location.")
        checkFile()
    }
}

// Call the function to check the file existence
