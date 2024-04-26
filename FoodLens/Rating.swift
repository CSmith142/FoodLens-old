//
//  Rating.swift
//  FoodLens
//
//  Created by Conor Smith on 10/04/2024.
//

import Foundation
import BarcodeScanner

enum Rating: Int {
    case bad = 1
    case poor = 2
    case fair = 3
    case excellent = 4
    case superfood = 5
    
    func intValue() -> Int {
        return self.rawValue
    }
}
