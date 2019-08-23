//
//  ConfirmPassVC.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/23/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ConfirmPassVC: UIViewController {
    
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var passStatusLabel: UILabel!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    var previewPass: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.isEnabled = false
        passStatusLabel.isHidden = true
        
    }
    

    
    @IBAction func passTxt(_ sender: Any) {
        guard let pass = passTextField.text, passTextField.text != "" else { return }
        if pass == previewPass {
            doneBtn.isEnabled = true
            passStatusLabel.isHidden = true
            passTextField.backgroundColor = #colorLiteral(red: 0.3459209204, green: 0.3367728293, blue: 0.8370596766, alpha: 1)
        } else {
            passTextField.backgroundColor = .red
            doneBtn.isEnabled = false
            passStatusLabel.isHidden = false
        }
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        KeychainWrapper.standard.set(previewPass, forKey: "userPassword")
        performSegue(withIdentifier: TO_COMPLETE_CREATE, sender: nil)
    }
    
}
