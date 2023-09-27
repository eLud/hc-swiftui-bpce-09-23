//
//  GardenApp.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import SwiftUI

@main
struct GardenApp: App {

    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainView(isLogged: $isLoggedIn)
                    .transition(.scale.combined(with: .opacity).animation(.easeInOut))
            } else {
                LoginView(isLogged: $isLoggedIn)
                    .transition(.scale.combined(with: .opacity).animation(.easeInOut))
            }
        }
    }
}
