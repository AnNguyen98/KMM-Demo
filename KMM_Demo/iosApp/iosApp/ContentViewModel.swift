//
//  ContentViewModel.swift
//  ContentViewModel
//
//  Created by An Nguyen 2 on 9/9/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import Combine
import shared

extension ValidCasePasswords {
    
}

final class ContentViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    var isValidEmail: Bool {
        Validators().validateEmailAddress(email: email)
    }
    
    var validsStatePassword: [ValidCasePasswords] {
        Validators().validatePassword(password: password)
    }
    
    var isValidInfo: Bool {
        isValidEmail && validsStatePassword.count == ValidCasePasswords.values().size
    }
}
