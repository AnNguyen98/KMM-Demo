//
//  ContentViewModel.swift
//  ContentViewModel
//
//  Created by An Nguyen 2 on 9/9/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import Combine
import shared

final class ContentViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    var isValidEmail: Bool {
        Validators().validateEmailAddress(email: email)
    }
    
    var validsStatePassword: [ValidCasePasswords] {
        Validators().validatePassword(password: password)
    }
    
    var isValidInfo: Bool {
        isValidEmail && validsStatePassword.count == ValidCasePasswords.values().size
    }
    
    var currentUser: User {
        let user: User = User()
        user.email = email
        user.password = password
        return user
    }
    
    func saveUserInfo() {
        RealmDatabase.shared.addUser(user: currentUser)
    }
    
    func clearUser() {
        RealmDatabase.shared.deleteAll()
    }
    
    func getUser() -> User? {
        RealmDatabase.shared.getUser()
    }
}
