//
//  FileChecker.swift
//  FoodLens
//
//  Created by Conor Smith on 25/04/2024.
//

// FileChecker.swift

import Foundation
import BarcodeScanner

class FileChecker {
    
    // Define the file URL here
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("restorecount.plist")
    
    // Function to check file existence
    func checkFileExistence() {
        if let fileURL = fileURL {
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: fileURL.path) {
                print("File exists at the specified location.")
            } else {
                print("File does not exist at the specified location.")
            }
        } else {
            print("File URL is nil.")
        }
    }
}
