//
//  WalletViewController.swift
//  SoftChain Wallet
//
//  Created by Jerry on 2018/8/6.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import HDWalletKit

class WalletViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var importBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var address: String?
    var balance: String?
    var wallet: Wallet?
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateAddressLabel), name: WALLET_ADDRESS, object: nil)
        setupImportBtn()
        setupAddressLabel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupImportBtn()
        getAccountBalance()
    }
    
    func setupAddressLabel() {
        if UserData.instance.isImportWallet {
            if KeychainWrapper.standard.hasValue(forKey: "mnemonic") {
                print("Import by mnemonic")
                
                guard let pass = KeychainWrapper.standard.string(forKey: "userPassword") else { return }
                guard let mnemonic = KeychainWrapper.standard.string(forKey: "mnemonic") else { return }
                let seed = Mnemonic.createSeed(mnemonic: mnemonic, withPassphrase: pass)
                self.wallet = Wallet(seed: seed, coin: .ethereum)
                for i in 0...60 {
                    let accounts = self.wallet?.generateAddress(at: UInt32(i))
                    print(accounts as Any)
                }
                
                //self.address = self.account?.address
                //addressLabel.text = address!

            } else if KeychainWrapper.standard.hasValue(forKey: "privateKey") {
                print("Import by private key")
                let retrievedString: String? = KeychainWrapper.standard.string(forKey: "privateKey")
                let pk = PrivateKey.init(pk: retrievedString!, coin: .ethereum)
                let address = pk?.publicKey.address
                addressLabel.text = address
            }
            
        } else {
            print("Address label removed")
            addressLabel.text = "...."
        }
    }
    
    func setupImportBtn() {
        if UserData.instance.isImportWallet {
            importBtn.isHidden = true
            deleteBtn.isHidden = false
        } else {
            importBtn.isHidden = false
            deleteBtn.isHidden = true
        }
    }
    
    func getAccountBalance() {
        guard address != nil else { return }
        GetQKCBalance.instance.getBalance(address: address!) { (success) in
            if success {
                self.balance = GetQKCBalance.instance.QKCBalance
                self.balanceLabel.text = "QKC: \((self.convertor(hex: self.balance!)/1e+18))"
            } else {
                print("Error to get balance")
            }
        }
    }
    
    func jumpToWelcomeVC() {
        if UserData.instance.isImportWallet {
            viewDidLoad()
        } else {
            
        }
    }
    
    func convertor(hex: String) -> Double {
        var hexnumber = hex
        var decimalInt: Double
        if hexnumber != "" {
            hexnumber = hexnumber.replacingOccurrences(of: "0x", with: "")
            decimalInt = String.changeToInt(num: hexnumber)
            return decimalInt
        } else {
            return 0
        }
    }
    
    @objc func updateAddressLabel(notif: Notification) {
        
        guard let address = notif.object as? String else { return }
        addressLabel.text = address
        self.address = address
        print("Function Called")
    }
    
    @IBAction func importWallet(_ sender: Any) {
        performSegue(withIdentifier: TO_IMPORTVC, sender: nil)
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
        viewDidLoad()
        UserData.instance.isImportWallet = false
        balanceLabel.text = "QKC: ----"
        addressLabel.text = "----"
    }
    
    
}


extension String {
    
    static func changeToInt(num: String) -> Double {
        let str = num.uppercased
        var sum: Double = 0
        for i in str().utf8 {
            sum = sum * 16 + Double(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
}
