//
//  UserDataServices.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class UserData {
    
    static let instance = UserData()
    
    let defaults = UserDefaults.standard
    
    var isImportWallet: Bool {
        get {
            return defaults.bool(forKey: IMPORT_WALLET)
        }
        set {
            defaults.set(newValue, forKey: IMPORT_WALLET)
        }
    }
   
}

