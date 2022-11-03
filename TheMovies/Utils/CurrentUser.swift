//
//  CurrentUser.swift
//  TheMovies
//
//  Created by Sergio Maturano on 23/08/2022.
//

import UIKit

class CurrentUser: Any {
    
    static let shared = CurrentUser()
    var user: User? = nil

    var token: String {
        if let currentUser = user {
            return currentUser.tokenAcceso ?? ""
        }
        return ""
    }
    
    var isLogged: Bool {
        if let u = user {
            if !(u.tokenAcceso ?? "").isEmpty {
                return true
            }
        }
        return false
    }
    
    init() {
        self.user = User.getCached()
    }
    
    
}

