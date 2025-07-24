//
//  MainViewModel.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import Foundation

class MainViewModel: ObservableObject {
    
    
    var onLogout: (() -> Void)?
    func logout() {
       onLogout?()
    }
    
    var onShowSettings: (() -> Void)?
    func showSettings() {
        onShowSettings?()
    }
}
