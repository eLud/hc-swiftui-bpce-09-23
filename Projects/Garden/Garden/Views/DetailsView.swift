//
//  DetailsView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct DetailsView: View {

    @State private var url = "https://www.apple.com"

    var body: some View {
        VStack {
            TextField("URL", text: $url)
                .textFieldStyle(.roundedBorder)
                .padding()
            if let url = URL(string: url) {
                WebView(url: url)
            }
            Button("Navigate") {
                url = "https://www.microsoft.com"
            }
        }
    }
}

#Preview {
    DetailsView()
}
