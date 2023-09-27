//
//  RotationGestureExample.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct RotationGestureExample: View {
    @State var isRotating = false
    @State var rotationAngle = Angle(degrees: 0.0)

    var body: some View {
        Rectangle()
            .fill(isRotating ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotationEffect(rotationAngle)
            .gesture(rotation)
    }

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { value in
                isRotating = true
                rotationAngle = value
            }
            .onEnded { _ in
                isRotating = false
                withAnimation {
                    rotationAngle = .zero
                }
            }
    }
}

extension RotationGestureExample {
    static var code: String {
        """
        struct RotationGestureExample: View {
            @State var isRotating = false
            @State var rotationAngle = Angle(degrees: 0.0)

            var body: some View {
                Rectangle()
                    .fill(isRotating ? Color.red : Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .rotationEffect(rotationAngle)
                    .gesture(rotation)
            }

            var rotation: some Gesture {
                RotationGesture()
                    .onChanged { value in
                        isRotating = true
                        rotationAngle = value
                    }
                    .onEnded { _ in
                        isRotating = false
                        withAnimation {
                            rotationAngle = .zero
                        }
                    }
            }
        }
        """
    }
}

struct RotationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureExample()
    }
}
