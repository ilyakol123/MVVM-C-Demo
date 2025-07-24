//
//  AuthViewModel.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 22.07.2025.
//

import Combine
import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var login: String = ""
    @Published var password: String = ""
    
    @Published var isErrorOccured: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var onLoginSuccess: (() -> Void)?
    
    func credsIsValid() -> Bool {
        !login.isEmpty && !password.isEmpty
    }
    
    func signIn() {
        guard credsIsValid() else {
            isErrorOccured = true
            errorMessage = "Login or Password should not be empty"
            return
        }
        
        errorMessage = nil
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false

            if self.login == "123", self.password == "123" {
                self.onLoginSuccess?()
            } else {
                self.errorMessage = "Неверный email или пароль"
            }
        }
    }
    

}
