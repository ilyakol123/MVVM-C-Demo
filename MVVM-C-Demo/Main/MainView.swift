//
//  MainView.swift
//  MVVM-C-Demo
//
//  Created by Илья Колесников on 23.07.2025.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        Text("After login")
        Button {
            viewModel.logout()
        } label: {
            Text("Logout")
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
        Button {
            viewModel.showSettings()
        } label: {
            Text("Settings")
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}
