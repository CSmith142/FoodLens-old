//
//  TabbedContentView.swift
//  FoodLens
//
//  Created by Conor Smith on 20/04/2024.
//

import SwiftUI
import BarcodeScanner

struct TabbedContentView: View {
    @StateObject var historyViewModel = HistoryViewModel()

    var body: some View {
        TabView {
            // Placeholder for Scan tab
            Text("Scan Content")
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("Scan")
                }
            
            // Placeholder for Recommended tab
            RecommendedProductsView(viewModel: RecommendedProductsViewModel())
                .tabItem {
                    Image(systemName: "football")
                    Text("Recommended")
                }

            // Placeholder for History tab
            HistoryView(viewModel: historyViewModel)
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }

            // Placeholder for Search tab
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            // Placeholder for Overview tab
            OverviewView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Overview")
                }
        }
    }
}
