//
//  AuthView.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 22.07.2025.
//

import SwiftUI

struct AuthView: View {

    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField("Login", text: $viewModel.login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .shadow(radius: 5)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(radius: 5)

            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Log in") {
                    viewModel.signIn()
                }
                .buttonStyle(.borderedProminent)
                .shadow(radius: 5)
            }

        }
        .alert("Error", isPresented: $viewModel.isErrorOccured) {
            Button(role: .cancel) {

            } label: {
                Text("OK")
            }
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
        .padding()
    }
}

#Preview {
    AuthView(viewModel: AuthViewModel(authService: MockAuthService()))
}
