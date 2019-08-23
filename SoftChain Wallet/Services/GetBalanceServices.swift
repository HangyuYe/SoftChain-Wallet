//
//  GetBalanceServices.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class GetQKCBalance {
    
    static let instance = GetQKCBalance()
    
    var body = [String: Any]()
    var QKCBalance = ""
    
    func configBody(address: String) -> [String: Any] {
        body = [
            "jsonrpc": "2.0",
            "method": "getBalances",
            "params": [address],
            "id": 1
        ]
        return body
    }
    
    func getBalance(address: String, completion: @escaping (_ Success: Bool) -> ()) {
        Alamofire.request(DEV_NET, method: .post, parameters: configBody(address: address), encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                let result = json["result"]
                let balances = result["balances"].array
                guard balances != nil else { return }
                for item in balances! {
                    let tokenId = item["tokenStr"].stringValue
                    if tokenId == "QKC" {
                        self.QKCBalance = item["balance"].stringValue
                        completion(true)
                    } else {
                        self.QKCBalance = "0"
                    }
                }
            } else {
                print(response.error as Any)
                completion(false)
            }
        }
    }
}
