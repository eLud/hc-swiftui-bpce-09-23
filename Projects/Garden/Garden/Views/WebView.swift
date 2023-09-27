//
//  WebView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        print("Make")
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if uiView.url != url {
            uiView.load(URLRequest(url: url))
        }
        print("Update")
    }
}
