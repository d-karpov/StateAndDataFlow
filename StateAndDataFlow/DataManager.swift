//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Денис Карпов on 01.02.2022.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func fetchUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func clear(userManager: UserManager) {
        userData = nil
        userManager.user = User()
    }
}
