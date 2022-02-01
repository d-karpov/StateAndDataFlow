//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Денис Карпов on 01.02.2022.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if !userManager.user.isRegistered {
                RegisterView()
            } else {
                ContentView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
