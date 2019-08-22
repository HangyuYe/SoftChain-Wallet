//
//  WalletViewController.swift
//  SoftChain Wallet
//
//  Created by Jerry on 2018/8/6.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var importBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateAddressLabel), name: NSNotification.Name("walletAddress"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupImportBtn()
    }
    
    func setupImportBtn() {
        if UserWallet.instance.isLoggedIn {
            importBtn.isHidden = true
            deleteBtn.isHidden = false
        } else {
            importBtn.isHidden = false
            deleteBtn.isHidden = true
        }
    }
    
    @objc func updateAddressLabel(notif: Notification) {
        
        guard let address = notif.object as? String else { return }
        addressLabel.text = address
        print("function called")
    }
    
    @IBAction func importWallet(_ sender: Any) {
        performSegue(withIdentifier: TO_IMPORTVC, sender: nil)
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
    }
    
    
}
