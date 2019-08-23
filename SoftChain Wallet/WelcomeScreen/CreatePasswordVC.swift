//
//  CreatePasswordVC.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/23/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class CreatePasswordVC: UIViewController {

    @IBOutlet weak var passTextFiel: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var pass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
        self.passTextFiel.addTarget(self, action: #selector(showNextBtn), for: .editingChanged)
    }
    
    @objc func showNextBtn() {
        if self.passTextFiel.text == "" {
            nextBtn.isHidden = true
        } else {
            nextBtn.isHidden = false
            self.pass = passTextFiel.text
        }
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CONFRIMVC, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmVC = segue.destination as? ConfirmPassVC {
            confirmVC.previewPass = self.pass
            
        }
    }
    
    
    
}
