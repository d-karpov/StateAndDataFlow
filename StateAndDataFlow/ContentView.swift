//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Денис Карпов on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            LargeTitleText(text: "Hi, \(userManager.user.name)")
            LargeTitleText(text: "\(timer.counter)")
            Spacer()
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            Spacer()
            ButtonView(title: "Logout", color: .blue) {
                DataManager.shared.clear(userManager: userManager)
            }
          
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
