//
//  FileCheckerController.swift
//  FoodLens
//
//  Created by Conor Smith on 25/04/2024.
//

import UIKit
import BarcodeScanner

class FileCheckerController: UIViewController {

    // Define the file URL here
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("restorecount.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the renamed function
        checkFile()
    }
    
    // Renamed function to check file existence
    func checkFile() {
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
