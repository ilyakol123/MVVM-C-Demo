//
//  MainCoordinator.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import Foundation
import SwiftUICore

class MainCoordinator: Coordinator {
    var onLogout: (() -> Void)?
    var onShowSettings: (() -> Void)?
    
    func start() -> AnyView {
        let vm = MainViewModel()
        vm.onLogout = { [weak self] in
            self?.onLogout?()
        }
        vm.onShowSettings = { [weak self] in
            self?.onShowSettings?()
        }
        
        return AnyView(MainView(viewModel: vm))
    }
}
