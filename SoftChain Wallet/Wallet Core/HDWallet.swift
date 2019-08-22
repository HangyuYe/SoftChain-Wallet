//
//  HDWallet.swift
//  SoftChain Wallet
//
//  Created by Jerry on 8/21/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import HDWalletKit

func createWallet() {
    let mnemonic = Mnemonic.create()
    let seed = Mnemonic.createSeed(mnemonic: mnemonic)
    let wallet = Wallet(seed: seed, coin: Coin.ethereum)
    let account = wallet.generateAccount()
    let address = account.address
    print(address)
}
