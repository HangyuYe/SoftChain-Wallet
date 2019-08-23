//
//  CompleteCreateVC.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/24/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import HDWalletKit
import SwiftKeychainWrapper

class CompleteCreateVC: UIViewController {
    
    @IBOutlet weak var spainner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        spainner.startAnimating()
        self.navigationController?.isNavigationBarHidden = true
        createMnemonic()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.spainner.stopAnimating()
            self.performSegue(withIdentifier: TO_MAIN, sender: nil)
        }
    }
    
    func createMnemonic() {
        let mnemonic = Mnemonic.create()
        KeychainWrapper.standard.set(mnemonic, forKey: "mnemonic")
        UserData.instance.isImportWallet = true
    }
    
}
