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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importBtn.isHidden = true
    }

    
}
