//
//  DetailsView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct DetailsView: View {

    @State private var urlString = "https://www.apple.com"
    @State private var url: URL?
    @State private var isLoading = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView {
                    Text("Loading")
                }
            }
            TextField("URL", text: $urlString)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onKeyPress(keys: [.return]) { _ in
                    url = URL(string: urlString)
                    return .handled
                }

            WebView(url: $url, isLoading: $isLoading)
            Button("Navigate") {
                url = URL(string: "https://www.microsoft.com")
            }
        }
        .onChange(of: url) { oldValue, newValue in
            guard let newValue else { return }
            urlString = newValue.absoluteString
        }
    }
}

#Preview {
    DetailsView()
}
