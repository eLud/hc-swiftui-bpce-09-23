//
//  WebView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import WebKit
import SwiftUI

#if os(iOS)
struct WebView: UIViewRepresentable {

    @Binding var url: URL?
    @Binding var isLoading: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        print("Make")
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url, uiView.url != url, !isLoading {
            uiView.load(URLRequest(url: url))
        }
        print("Update")
    }

    func makeCoordinator() -> Coordinator {
        print("Make Coord")
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {

        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            if let url = webView.url {
                parent.url = url
            }
        }
    }
}
#elseif os(macOS)
struct WebView: NSViewRepresentable {

    @Binding var url: URL?
    @Binding var isLoading: Bool

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        print("Make")
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        if let url, nsView.url != url, !isLoading {
            nsView.load(URLRequest(url: url))
        }
        print("Update")
    }

    func makeCoordinator() -> Coordinator {
        print("Make Coord")
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {

        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            if let url = webView.url {
                parent.url = url
            }
        }
    }
}

#endif
