//
//  RebeloperStoreKeys.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 25/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

// Get the full version of Rebeloper Store here:
// https://store.rebeloper.com/rebeloper-store

import Foundation

struct RebeloperStoreKey {
    
    struct UserInfo {
        static let purchase = "purchase"
        static let result = "result"
    }
    
    struct Product {
        static let id = "id"
        static let title = "title"
        static let description = "description"
        static let price = "price"
        static let virtualCurrencyType = "virtualCurrencyType"
        static let virtualCurrencyPayableType = "virtualCurrencyPayableType"
        static let virtualCurrencyAmount = "virtualCurrencyAmount"
        static let virtualCurrencyPayableAmount = "virtualCurrencyPayableAmount"
        static let virtualCurrencyBuyButtonText = "virtualCurrencyBuyButtonText"
        static let virtualGoodIsConsumable = "virtualGoodIsConsumable"
        static let virtualGoodType = "virtualGoodType"
        static let virtualGoodAmount = "virtualGoodAmount"
        static let virtualGoodBuyButtonText = "virtualGoodBuyButtonText"
        static let virtualgoodAlreadyPurchasedButtonText = "virtualgoodAlreadyPurchasedButtonText"
    }
}
