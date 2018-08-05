//
//  ButtomDemoViewController.swift
//  SoftChain Wallet
//
//  Created by Jerry on 2018/8/1.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class ButtomDemoViewController: UIViewController {

    
    @IBOutlet weak var SendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendBtnPressed(_ sender: Any) {
        SendBtn.wiggle()
    }
    
}

