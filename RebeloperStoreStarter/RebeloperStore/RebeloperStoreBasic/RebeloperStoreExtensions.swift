//
//  RebeloperStoreExtensions.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 29/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

// Get the full version of Rebeloper Store here:
// https://store.rebeloper.com/rebeloper-store

import UIKit
import MerchantKit

extension AppDelegate: MerchantDelegate, ProductInterfaceControllerDelegate {
    
    func startRebeloperStore() {
        RebeloperStore.setupMerchant(delegate: self)
        RebeloperStore.setupProductInterfaceController(delegate: self)
        RebeloperStore.listenForRestorePurchases()
        
//        RebeloperStoreKeychainAccount.setup()
    }
    
    // MARK: -
    // MARK: Merchant Delegate
    func merchant(_ merchant: Merchant, didChangeStatesFor products: Set<Product>) {
        print("\(merchant) did change states for products:")
    }
    
    func merchant(_ merchant: Merchant, validate request: ReceiptValidationRequest, completion: @escaping (_ result: Result<Receipt>) -> Void) {
        let validator = LocalReceiptValidator(request: request)
        validator.onCompletion = { result in
            completion(result)
        }
        
        validator.start()
    }
    
    func merchant(_ merchant: Merchant, didConsume product: Product) {
        print("\(merchant) did consume product: \(product)")
        let productId = product.identifier
//        RebeloperStore.saveRealPurchaseIntoRebeloperStoreKeychain(productId)
    }
    
    func merchantDidChangeLoadingState(_ merchant: Merchant) {
        print("\(merchant) did change loading state")
        NotificationCenter.default.post(name: notificationNameReloadProductsUI, object: nil, userInfo: nil)
    }
    
    // MARK: -
    // MARK: ProductInterfaceController Delegate
    
    func productInterfaceControllerDidChangeFetchingState(_ controller: ProductInterfaceController) {
        NotificationCenter.default.post(name: notificationNameReloadProductsUI, object: nil, userInfo: nil)
    }
    
    func productInterfaceController(_ controller: ProductInterfaceController, didChangeStatesFor products: Set<Product>) {
        print("did change states for products:")
        for product in products {
            print("fetched \(product)")
        }
    }
    
    func productInterfaceController(_ controller: ProductInterfaceController, didCommit purchase: Purchase, with result: ProductInterfaceController.CommitPurchaseResult) {
        
        switch result {
        case .succeeded:
            print("didCommit: \(purchase) with result: \(result)")
            let userInfo = [RebeloperStoreKey.UserInfo.purchase: purchase, RebeloperStoreKey.UserInfo.result: result] as [String : Any]
            NotificationCenter.default.post(name: notificationNameReloadProductsUI, object: nil, userInfo: userInfo)
        case .failed(let err, shouldDisplayError: true):
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "\(err.localizedDescription)")
        case .failed(_, _):
            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Please, try again later")
        }
        
    }
    
    func productInterfaceController(_ controller: ProductInterfaceController, didRestorePurchasesWith result: ProductInterfaceController.RestorePurchasesResult) {
        
        switch result {
        case .succeeded(let productsSet):
            let userInfo = ["userInfo" : productsSet]
            NotificationCenter.default.post(name: notificationNameRestorePurchasesSuccess, object: nil, userInfo: userInfo)
        case .failed(let err):
            let userInfo = ["userInfo" : err]
            NotificationCenter.default.post(name: notificationNameRestorePurchasesFailed, object: nil, userInfo: userInfo)
        }
        
        NotificationCenter.default.post(name: notificationNameReloadProductsUI, object: nil, userInfo: nil)
    }
}

extension UIApplication {
    class func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base
    }
}

extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
}

extension TimeInterval {
    func asDays() -> String {
        let interval = Int(self)
        let days = Int(interval / 3600 / 24)
        let string = days == 1 ? String(format: "1 day") : String(format: "%02d days", days)
        return string
    }
}
