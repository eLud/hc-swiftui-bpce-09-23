//
//  ColoredCapsuleButtonStyle.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct ColoredCapsuleButtonStyle: ButtonStyle {

    let capsuleColor: Color
    let textColor: Color

    init(capsuleColor: Color = .blue, textColor: Color = .white) {
        self.capsuleColor = capsuleColor
        self.textColor = textColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundStyle(textColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background {
                Capsule()
                    .foregroundStyle(capsuleColor)
            }
    }
}
