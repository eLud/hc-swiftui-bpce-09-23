//
//  FirstMeetApp.swift
//  FirstMeet
//
//  Created by Ludovic Ollagnier on 25/09/2023.
//

import SwiftUI

@main
struct FirstMeetApp: App {
    
    @StateObject private var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView(commercialImageName: nil)
                .environmentObject(userData)
        }
    }
}
