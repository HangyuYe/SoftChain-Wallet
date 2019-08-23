//
//  WelcomeViewController.swift
//  SoftChain Wallet
//
//  Created by Jerry on 2018/8/6.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
    
    @IBAction func createPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATEVC, sender: nil)
    }
    
    @IBAction func restorePressed(_ sender: Any) {
        performSegue(withIdentifier: TO_IMPORTVC, sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
