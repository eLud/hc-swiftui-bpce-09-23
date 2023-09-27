//
//  FouDeFoodWatchApp.swift
//  FouDeFoodWatch Watch App
//
//  Created by Ludovic Ollagnier on 29/06/2023.
//

import SwiftUI
import Common

@main
struct FouDeFoodWatch_Watch_AppApp: App {

    @StateObject private var data = AppData()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    FoodListView()
                }
                Text("Second  view")
                    .tabItem {
                        Label("Second", systemImage: "leaf")
                    }
                Text("Third  view")
            }
                .environmentObject(data)
        }
    }
}
