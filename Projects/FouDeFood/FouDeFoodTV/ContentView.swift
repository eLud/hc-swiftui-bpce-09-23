//
//  ContentView.swift
//  FouDeFoodTV
//
//  Created by Ludovic Ollagnier on 28/06/2023.
//

import SwiftUI
import Common

struct ContentView: View {

    @EnvironmentObject private var data: AppData
    let columns: [GridItem] = [GridItem()]

    @State private var showPanel = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Last restaurants")
                    .font(.headline)
                lastRestaurantsScrollView

                Text("Top rated restaurants")
                    .font(.headline)
                lastRestaurantsScrollView

                Text("Worst restaurants")
                    .font(.headline)
                lastRestaurantsScrollView
            }
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .trailing) {
                if showPanel {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.thinMaterial)
                        .frame(width: 400)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                        .edgesIgnoringSafeArea(.trailing)
                }
            }
        }
    }

    private var lastRestaurantsScrollView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns) {
                ForEach(data.restaurants) { r in
                    NavigationLink(destination: RestaurantDetailsView(restaurant: r)) {
                        RestaurantImageCell(restaurant: r)
                    }.buttonStyle(.card)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
