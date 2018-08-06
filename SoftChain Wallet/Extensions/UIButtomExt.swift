//
//  UIBottomExt.swift
//  SoftChain Wallet
//
//  Created by Jerry on 2018/8/3.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

extension UIButton {
    func wiggle() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        //Each loop need time (exp. repeat 1 time need take 0.01s)
        wiggleAnim.duration = 0.01
        //In times the unit is times (exp. repeat 10 times)
        wiggleAnim.repeatCount = 10
        //Allowed animation reverses when last animate finished
        wiggleAnim.autoreverses = true
        //Animation start point
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 2, y: self.center.y)
        //Animation end point
        wiggleAnim.toValue = CGPoint(x: self.center.x + 2, y: self.center.y)
        
        layer.add(wiggleAnim, forKey: "position")
    }
}
