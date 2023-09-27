//
//  RestaurantImageCell.swift
//  FouDeFoodTV
//
//  Created by Ludovic Ollagnier on 28/06/2023.
//

import SwiftUI
import Common

struct RestaurantImageCell: View {

    @FocusState private var isFocused

    let restaurant: Restaurant

    var body: some View {
        AsyncImage(url: restaurant.imageURL, content: { i in
            i
                .resizable()
                .cornerRadius(20)
        }, placeholder: {
            ProgressView()
        })
        .overlay(alignment: .bottom) {
            Text(restaurant.name)
        }
        .frame(width: 600, height: 400)
        .overlay {
            if isFocused {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.red, lineWidth: 10)
            }
        }
        .hoverEffect()
        .focusable()
        .focused($isFocused)
        .padding()
    }
}

struct RestaurantImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantImageCell(restaurant: Restaurant(name: "", address: "", restaurantType: .both, foodStyle: .burger))
    }
}
