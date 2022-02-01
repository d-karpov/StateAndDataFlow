//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Денис Карпов on 01.02.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.fetchUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
