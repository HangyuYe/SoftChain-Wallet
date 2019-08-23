//
//  ImportVC.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import HDWalletKit
import SwiftKeychainWrapper

class ImportVC: UIViewController {

    @IBOutlet weak var privateKeyTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var comfirmTextField: UITextField!
    
    var address: String?
    let shardID: String = "00000000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTapToDismiss()
    }
    
    func createWallet() {
        guard let privateKey = privateKeyTextField.text, privateKeyTextField.text != "" else { return }
        let userPrivateKey = PrivateKey.init(pk: privateKey, coin: .ethereum)
        KeychainWrapper.standard.set(privateKey, forKey: "privateKey")
        self.address = (userPrivateKey?.publicKey.address)!
        self.address = self.address! + shardID
        NotificationCenter.default.post(name: WALLET_ADDRESS, object: self.address)
    }
    
    func checkPassConsistency () {
        guard let passcode = passTextField.text, passTextField.text != "" else { return }
        guard let comfirm = comfirmTextField.text, comfirmTextField.text != "" else { return }
        let alert = UIAlertController(title: "Warning", message: "The password is not consistency, Please Try again!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        if passcode == comfirm {
            createWallet()
            UserWallet.instance.isLoggedIn = true
            print("Password Comfired!")
        } else {
            self.present(alert, animated: true, completion: nil)
            print("Password is invaild!")
        }
        
    }
    
    
    func handleTapToDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func importBtn(_ sender: Any) {
        checkPassConsistency()
        dismiss(animated: true, completion: nil)
    }
}
