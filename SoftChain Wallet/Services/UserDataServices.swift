//
//  UserDataServices.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation

class UserWallet {
    
    static let instance = UserWallet()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
   
}

