//
//  RatingControl.swift
//  FoodLens
//
//  Created by Conor Smith on 21/04/2024.
//
import SwiftUI

struct RatingControl: View {
    @Binding var rating: Int
    var onRatingChanged: (Int) -> Void

    var body: some View {
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        rating = index
                        // Call the callback to update the rating in the ViewModel
                        onRatingChanged(index)
                    }
            }
        }
    }
}
