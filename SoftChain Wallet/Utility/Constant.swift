//
//  Constant.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/22/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation

//URL
let DEV_NET = "http://jrpc.devnet.quarkchain.io:38391"
let MAIN_NET = "http://jrpc.mainnet.quarkchain.io:38391"

//Segue
let TO_IMPORTVC = "toImportVC"
let TO_CREATEVC = "toCreateVC"
let TO_CONFRIMVC = "toConfrimVC"
let TO_COMPLETE_CREATE = "toCompleteVC"
let TO_MAIN = "toMainVC"

//User Defaults
let IMPORT_WALLET = "loggedIn"

//Header
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//Notification
let WALLET_ADDRESS = Notification.Name("walletAddress")

