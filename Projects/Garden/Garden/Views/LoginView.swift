//
//  LoginView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 27/09/2023.
//

import SwiftUI

struct LoginView: View {

    @Binding var isLogged: Bool
    @State private var login = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Login", text: $login)
            SecureField("Password", text: $password)
            Button("Connect") {
                isLogged = login == password
            }
            .isHidden(login.isEmpty)
            .padding()
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(ColoredCapsuleButtonStyle())
        .padding()
    }
}



#Preview {
    LoginView(isLogged: .constant(true))
}
