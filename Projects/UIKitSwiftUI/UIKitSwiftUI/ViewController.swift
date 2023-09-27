//
//  ViewController.swift
//  UIKitSwiftUI
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func showSwiftUI(_ sender: Any) {
        let swiftUIView = SwiftUIVIew()
            .font(.largeTitle)

        let hosting = UIHostingController(rootView: swiftUIView)
        self.addChild(hosting)
        hosting.didMove(toParent: self)

        let extractedView = hosting.view!
        view.addSubview(extractedView)

        extractedView.translatesAutoresizingMaskIntoConstraints = false

        view.centerXAnchor.constraint(equalTo: extractedView.centerXAnchor).isActive = true
        view.topAnchor.constraint(equalTo: extractedView.topAnchor).isActive = true
        extractedView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        extractedView.heightAnchor.constraint(equalToConstant: 300).isActive = true


//        let nav = UINavigationController(rootViewController: hosting)
//        present(nav, animated: true)
    }
    
}

