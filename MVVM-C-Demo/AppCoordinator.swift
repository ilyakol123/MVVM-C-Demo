//
//  AppCoordinator.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 23.07.2025.
//

import Foundation
import SwiftUI

protocol Coordinator: AnyObject {
    func start() -> AnyView
}

final class AppCoordinator: ObservableObject {
    @Published var currentScreen: Screen = .auth

    enum Screen {
        case auth
        case main
        case settings
    }

    private var authCoordinator: AuthCoordinator?
    private var mainCoordinator: MainCoordinator?
    private var settingsCoordinator: SettingsCoordinator?

    func start() -> some View {
        switch currentScreen {
        case .auth:
            return makeAuthCoordinator().start()
        case .main:
            return makeMainCoordinator().start()
        case .settings:
            return makeSettingsCoordinator().start()
        }
    }
    private func makeAuthCoordinator() -> AuthCoordinator {
        if authCoordinator == nil {
            let coordinator = AuthCoordinator()
            coordinator.onLoginSuccess = { [weak self] in
                self?.currentScreen = .main
            }
            authCoordinator = coordinator
        }
        return authCoordinator!
    }

    private func makeMainCoordinator() -> MainCoordinator {
        if mainCoordinator == nil {
            let coordinator = MainCoordinator()
            coordinator.onLogout = { [weak self] in
                self?.currentScreen = .auth
            }
            coordinator.onShowSettings = { [weak self] in
                self?.currentScreen = .settings
                
            }
            mainCoordinator = coordinator
        }
        
        return mainCoordinator!
    }

    private func makeSettingsCoordinator() -> SettingsCoordinator {
        if settingsCoordinator == nil {
            let coordinator = SettingsCoordinator()
            coordinator.onBack = { [weak self] in
                self?.currentScreen = .main
            }
            settingsCoordinator = coordinator
        }
        return settingsCoordinator!
    }

    //    func makeAuthView() -> some View {
    //        let authService = MockAuthService()
    //        let viewModel = AuthViewModel(authService: authService)
    //
    //        viewModel.onLoginSuccess = { [weak self] in
    //            DispatchQueue.main.async {
    //                self?.currentScreen = .main
    //            }
    //        }
    //
    //        return AuthView(viewModel: viewModel)
    //
    //    }
    //
    //    func makeMainView() -> some View {
    //        let mainViewModel = MainViewModel()
    //        mainViewModel.onLogout = { [weak self] in
    //            DispatchQueue.main.async {
    //                self?.currentScreen = .auth
    //            }
    //        }
    //        mainViewModel.onShowSettings = { [weak self] in
    //            DispatchQueue.main.async {
    //                self?.currentScreen = .settings
    //            }
    //        }
    //        return MainView(viewModel: mainViewModel)
    //    }
    //
    //    func makeSettingsView() -> some View {
    //        let settingsViewModel = SettingsViewModel()
    //        settingsViewModel.onBack = { [weak self] in
    //            DispatchQueue.main.async {
    //                self?.currentScreen = .main
    //            }
    //        }
    //        return SettingsView(viewModel: settingsViewModel)
    //
    //    }
}
