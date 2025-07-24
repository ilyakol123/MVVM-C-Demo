//
//  AuthCoordinator.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import Foundation
import SwiftUICore

final class AuthCoordinator: Coordinator {
    var onLoginSuccess: (() -> Void)?
    
    func start() -> AnyView {
        let vm = AuthViewModel()
        vm.onLoginSuccess = { [weak self] in
            self?.onLoginSuccess?()
        }
        return AnyView(AuthView(viewModel: vm))
    }
}
