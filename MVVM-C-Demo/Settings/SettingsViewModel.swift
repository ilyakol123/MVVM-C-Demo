//
//  SettingsViewModel.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import Foundation

class SettingsViewModel: ObservableObject {

    var onBack: (() -> Void)?
    func back() {
        onBack?()
    }
}
