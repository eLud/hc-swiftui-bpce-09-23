//
//  LoginView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct LoginView: View {

    @Binding var isLogged: Bool

    var body: some View {
        VStack {
            TextField("Login", text: .constant(""))
            SecureField("Password", text: .constant(""))
            Button("Connect") {
                isLogged = true
            }
        }
    }
}

#Preview {
    LoginView(isLogged: .constant(true))
}
