//
//  SettingsCoordinator.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import Foundation
import SwiftUICore

class SettingsCoordinator: Coordinator {
    var onBack: (() -> Void)?
    
    func start() -> AnyView{
        let vm = SettingsViewModel()
        vm.onBack = { [weak self] in
            self?.onBack?()
        }
        return AnyView(SettingsView(viewModel: vm))
    }
}
