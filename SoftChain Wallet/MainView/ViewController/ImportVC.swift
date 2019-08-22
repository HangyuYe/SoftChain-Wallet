//
//  ImportVC.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import HDWalletKit

class ImportVC: UIViewController {

    @IBOutlet weak var privateKeyTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var comfirmTextField: UITextField!
    
    var address: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTapToDismiss()
    }
    
    func createWallet() {
        guard let privateKey = privateKeyTextField.text, privateKeyTextField.text != "" else { return }
        let userPrivateKey = PrivateKey.init(pk: privateKey, coin: .ethereum)
        self.address = (userPrivateKey?.publicKey.address)!
        let noti = Notification.Name("walletAddress")
        NotificationCenter.default.post(name: noti, object: self.address)
    }
    
    func checkPassConsistency () {
        guard let passcode = passTextField.text, passTextField.text != "" else { return }
        guard let comfirm = comfirmTextField.text, comfirmTextField.text != "" else { return }
        let alert = UIAlertController(title: "Warning", message: "Twe input is not consistency, Please Try again!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        if passcode == comfirm {
            createWallet()
            print("Passcode is passed!")
        } else {
            self.present(alert, animated: true, completion: nil)
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
