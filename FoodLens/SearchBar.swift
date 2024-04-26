//
//  SearchBar.swift
//  FoodLens
//
//  Created by Conor Smith on 21/04/2024.
//

import SwiftUI
import BarcodeScanner

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            Button(action: {
                // Action when search button is tapped
                print("Search button tapped")
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 20)
        }
    }
}
