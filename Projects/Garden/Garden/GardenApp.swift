//
//  GardenApp.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import SwiftUI

@main
struct GardenApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Garden", systemImage: "leaf")
                    }
                Text("Other View")
                    .tabItem {
                        Label("Other", systemImage: "gear")
                    }
                Image(systemName: "tree")
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
                Image(systemName: "tree")
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
                Image(systemName: "tree")
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
                Image(systemName: "tree")
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
                Image(systemName: "tree")
                    .tabItem {
                        Label("Tree", systemImage: "tree")
                    }
            }
        }
    }
}
