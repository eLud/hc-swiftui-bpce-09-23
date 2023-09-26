//
//  FormView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import SwiftUI

struct FormView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Form")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    FormView()
}
