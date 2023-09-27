//
//  HidingModifier.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

extension View {

    func isHidden(_ hidden: Bool) -> some View {
//        if !hidden {
//            self
//        }
        modifier(HidingModifier(isHidden: hidden))
    }
}

struct HidingModifier: ViewModifier {

    let isHidden: Bool

    func body(content: Content) -> some View {
        content.opacity(isHidden ? 0 : 1)
    }
}
