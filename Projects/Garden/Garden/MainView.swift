//
//  MainView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct MainView: View {

    @Binding var isLogged: Bool

    var body: some View {
        TabView {
            ContentView(isLogged: $isLogged)
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
        }    }
}

#Preview {
    MainView(isLogged: .constant(true))
}
