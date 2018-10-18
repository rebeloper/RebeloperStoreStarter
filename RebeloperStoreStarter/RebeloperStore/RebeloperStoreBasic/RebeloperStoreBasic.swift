//
//  RebeloperStoreBasic.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 15/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

// Get the full version of Rebeloper Store here:
// https://store.rebeloper.com/rebeloper-store

import Foundation
import MerchantKit

class RebeloperStore {
    
    // MARK: -
    // MARK: Properties
    
    static var merchant: Merchant?
    static var config: LocalConfiguration?
    static var productInterfaceController: ProductInterfaceController?
    
    // MARK: -
    // MARK: Enums
    
    public enum PurchaseOrder {
        case ascending
        case descending
    }
    
    // MARK: -
    // MARK: Setup
    
    static func setupMerchant(delegate: MerchantDelegate) {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            self.merchant = Merchant(storage: KeychainPurchaseStorage(serviceName: bundleIdentifier), delegate: delegate)
            if let merchant = self.merchant {
                do {
                    self.config = try MerchantKit.LocalConfiguration(fromResourceNamed: "RebeloperStoreConfig", extension: "plist")
                    if let products = self.config?.products {
                        merchant.register(products)
                        merchant.setup()
                    }
                } catch {
                    print("Setup Merchant Error")
                }
            }
        }
    }
    
    static func setupProductInterfaceController(delegate: ProductInterfaceControllerDelegate) {
        if let products = RebeloperStore.config?.products, let merchant = RebeloperStore.merchant {
            productInterfaceController = ProductInterfaceController(products: products, with: merchant)
            guard let productInterfaceController = productInterfaceController else { return }
            productInterfaceController.delegate = delegate
            productInterfaceController.fetchDataIfNecessary()
        }
    }
    
    // MARK: -
    // MARK: Fetch Purchases
    
    static func fetchPurchase(productId: String, kind: Product.Kind? = nil) -> Purchase? {
        guard let product = RebeloperStore.fetchProduct(with: productId, kind: kind), let purchase = RebeloperStore.fetchPurchase(for: product) else { return nil }
        return purchase
    }
    
    static func fetchPurchase(for product: Product) -> Purchase? {
        guard let productInterfaceController = productInterfaceController else { return nil }
        
        let productState = productInterfaceController.state(for: product)
        
        switch productState {
        case .unknown:
            return nil
        case .purchased(_, _):
            return nil
        case .purchasable(let purchase):
            return purchase
        case .purchasing(_):
            return nil
        case .purchaseUnavailable:
            return nil
        }
    }
    
    static func fetchPurchasesForConsumables(order: PurchaseOrder = .ascending) -> [Purchase]? {
        guard let productsSet = RebeloperStore.config?.products else { return nil }
        let allProductsArray = Array(productsSet)
        var purchases: [Purchase] = []
        for product in allProductsArray {
            if product.kind == .consumable {
                if let purchase = fetchPurchase(for: product) {
                    purchases.append(purchase)
                }
            }
        }
        
        if order == .ascending {
            purchases.sort(by: { $0.price.hashValue < $1.price.hashValue })
        } else {
            purchases.sort(by: { $0.price.hashValue > $1.price.hashValue })
        }
        
        return purchases
        
    }
    
    // MARK: -
    // MARK: Commit Purchases
    
    static func commitPurchase(_ purchase: Purchase) {
        guard let productInterfaceController = productInterfaceController, let product = RebeloperStore.fetchProduct(with: purchase.productIdentifier) else { return }
        
        let productState = productInterfaceController.state(for: product)
        
        switch productState {
        case .unknown:
            // consider loading/failure cases of fetchingState
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Product state is unknown. Please, try later")
        case .purchased(let purchasedProductInfo, let purchaseMetadata?):
            // product is owned, `PurchaseMetadata` represents the current price and other information about the purchase, if it was available to buy. This metadata may not always be available.
            print("\(purchasedProductInfo)")
            print("\(purchaseMetadata)")
            
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "You have already purchased this product")
            
        case .purchasable(let purchase):
            // product can be purchased, refer to `Purchase`
            productInterfaceController.commit(purchase)
        case .purchasing(_):
            // product is currently being purchased, probably show a loading UI for that particular product
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Currently purchasing")
        case .purchaseUnavailable:
            // purchase cannot be made, show some kind of warning in the UI
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Purchase is unavailable")
        case .purchased(let purchasedProductInfo, .none):
            print("\(purchasedProductInfo)")
            
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "You have already purchased this product")
        }
        
    }
    
    // MARK: -
    // MARK: Fetch Product
    
    static func fetchProduct(with id: String, kind: Product.Kind? = nil) -> Product? {
        guard let productsSet = RebeloperStore.config?.products else { return nil }
        let allProductsArray = Array(productsSet)
        for product in allProductsArray {
            if product.identifier == id {
                if let kind = kind {
                    if product.kind == kind {
                        return product
                    }
                } else {
                    return product
                }
            }
        }
        return nil
    }
    
    // MARK: -
    // MARK: Restore Purchases
    
    static func restorePurchases() {
        guard let productInterfaceController = productInterfaceController else { return }
        productInterfaceController.restorePurchases()
    }
    
    static func listenForRestorePurchases() {
        NotificationCenter.default.addObserver(forName: notificationNameRestorePurchasesSuccess, object: nil, queue: OperationQueue.main) { (notification) in
            guard let productsSet = notification.userInfo?["userInfo"] as? Set<Product> else { return }
            print("Restored purchases: \(productsSet)")
            RebeloperStoreService.showAlert(style: .alert, title: "Success", message: "Your Purchases are Restored")
        }
        
        NotificationCenter.default.addObserver(forName: notificationNameRestorePurchasesFailed, object: nil, queue: OperationQueue.main) { (notification) in
            guard let error = notification.userInfo?["userInfo"] as? Error else { return }
            print("Could not restore purchases: \(error.localizedDescription)")
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Could not restore your purchases with error: \(error.localizedDescription)")
        }
    }
    
}
