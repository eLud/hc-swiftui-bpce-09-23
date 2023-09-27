//
//  FormView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import SwiftUI

struct FormView: View {

    @Environment(\.dismiss) var dismiss

    @State private var text: String = "Form"
    @State private var isBig: Bool = false
    @Binding var isLogged: Bool

    var body: some View {
        VStack {
            Text(text)
            Button("Dismiss") {
                dismiss()
            }
            Button("Logout") {
                isLogged = false
            }
            Image(systemName: "leaf")
                .scaleEffect(isBig ? CGSize(width: 3, height: 3) : CGSize(width: 1, height: 1))
                .rotationEffect(isBig ? .degrees(90) : .degrees(0))
                .foregroundStyle(isBig ? .red : .primary)
                .onTapGesture {
                    text = "tapped"
                    isBig.toggle()
                }
                .animation(.bouncy, value: isBig)
        }
    }
}

#Preview {
    FormView(isLogged: .constant(true))
}
