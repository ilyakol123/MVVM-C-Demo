//
//  SettingsView.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 24.07.2025.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    var body: some View {
        Text("Settings here")
        
        Button {
            viewModel.back()
        } label: {
            Text("Back")
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}
