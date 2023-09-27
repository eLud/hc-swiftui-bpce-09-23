//
//  FouDeFoodApp.swift
//  FouDeFood
//
//  Created by Ludovic Ollagnier on 27/06/2023.
//

import SwiftUI
import Common

@main
struct FouDeFoodApp: App {

    @StateObject private var data = AppData(fakeData: true)
    @Environment(\.openWindow) private var openWindow

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                FoodListView()
            } detail: {
                Label("Select a restaurant", systemImage: "fork.knife.circle")
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem {
                Label("Food", systemImage: "fork.knife.circle")
            }
            .environmentObject(data)
        }.commands {
            CommandMenu("Food") {
                Button("Random food") { }
                    .disabled(true)
                Divider()
                Text("Bla")
                Menu("Titi") {
                    Button("Sub menu item", action: {})
                }
                Toggle(isOn: $data.isLoading) {
                    Text("Test data is loading")
                }
                .keyboardShortcut(.init("D"), modifiers: .command)
            }
            CommandGroup(after: .newItem) {
                Button("New Restaurant") {
                    openWindow(id: "new-resto-window")
                }
                    .keyboardShortcut(.init("n"), modifiers: [.command, .option])
            }
            CommandGroup(replacing: .appInfo) {
                Button("About…") {
                    openWindow(id: "about")
                }
            }
        }
/*
        Window("New restaurant", id: "new-resto-window") {
            RestaurantCreationFormView()
                .padding()
        }.windowResizability(.contentSize)

        WindowGroup("Details", id: "resto-window", for: Restaurant.self) { $resto in
            if let resto {
                RestaurantDetailsView(restaurant: resto)
            } else {
                Text("Select resto")
            }
        }

        MenuBarExtra {
            Button("Bla") {

            }
        } label: {
           Image(systemName: "leaf")
        }

        Settings {
            TabView {
                Form {
                    Text("A")
                    Toggle(isOn: .constant(true), label: {
                        Text("Set something")
                    })
                }
                    .tabItem {
                        Label("A", systemImage: "a.circle")
                    }
                Text("B")
                    .tabItem {
                        Label("B", systemImage: "b.circle")
                    }
            }.frame(width: 375, height: 150)
        }

        Window("About FouDeFood…", id: "about") {
            VStack {
                Text("FouDeFood")
                Image(systemName: "leaf")
            }
        }.defaultSize(width: 375, height: 150)
            .defaultPosition(.center)
 */
    }

}
