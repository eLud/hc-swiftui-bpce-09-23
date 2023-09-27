//
//  FouDeFoodTVApp.swift
//  FouDeFoodTV
//
//  Created by Ludovic Ollagnier on 28/06/2023.
//

import SwiftUI
import Common

@main
struct FouDeFoodTVApp: App {

    @StateObject private var data = AppData()

    @State private var resto: Restaurant?

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    ContentView()
                        .tabItem {
                            Label("Restaurants", systemImage: "fork.knife.circle.fill")
                        }
                    Text("Other")
                        .tabItem {
                            Label("Other", systemImage: "takeoutbag.and.cup.and.straw")
                        }
                }
            }
            .sheet(item: $resto, content: { r in
                RestaurantDetailsView(restaurant: r)
            })
            .environmentObject(data)
            .onOpenURL { url in
                print("\(url.absoluteString)")
                // Parse the url
                // Extract the restaurant
                // Set the selection
                resto = Restaurant(name: "From deeplink", address: "", restaurantType: .onSite, foodStyle: .burger)
            }
        }
    }
}
