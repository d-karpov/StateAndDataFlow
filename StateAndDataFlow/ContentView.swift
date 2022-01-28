//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            LargeTitleText(text: "Hi, \(userManager.name)")
            LargeTitleText(text: "\(timer.counter)")
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            Button("Logout", action: { userManager.isRegister.toggle() })
                .buttonStyle(color: .blue)
        }
    }
}

struct LargeTitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding(.top, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
