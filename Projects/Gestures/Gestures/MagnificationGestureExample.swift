//
//  MagnificationGestureExample.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct MagnificationGestureExample: View {
    @State var isMagnifying = false
    @State var scale: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(isMagnifying ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scale)
            .gesture(magnification)
    }

    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                isMagnifying = true
                scale = value
            }
            .onEnded { _ in
                isMagnifying = false
                withAnimation {
                    scale = 1.0
                }
            }
    }
}

extension MagnificationGestureExample {
    static var code: String {
        """
        struct MagnificationGestureExample: View {
            @State var isMagnifying = false
            @State var scale: CGFloat = 1.0

            var body: some View {
                Circle()
                    .fill(isMagnifying ? Color.red : Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .scaleEffect(scale)
                    .gesture(magnification)
            }

            var magnification: some Gesture {
                MagnificationGesture()
                    .onChanged { value in
                        isMagnifying = true
                        scale = value
                    }
                    .onEnded { _ in
                        isMagnifying = false
                        scale = 1.0
                    }
            }
        }
        """
    }
}

struct MagnificationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureExample()
    }
}
