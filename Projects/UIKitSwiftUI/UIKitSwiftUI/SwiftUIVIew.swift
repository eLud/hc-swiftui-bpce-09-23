//
//  SwiftUIVIew.swift
//  UIKitSwiftUI
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct SwiftUIVIew: View {
    var body: some View {
        NavigationLink(destination: Text("Youhou")) {
            Text("Hello, World!")
        }
    }
}

#Preview {
    SwiftUIVIew()
}
