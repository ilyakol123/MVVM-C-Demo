//
//  RootView.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 23.07.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        coordinator.start()
    }
}

#Preview {
    RootView()
}
