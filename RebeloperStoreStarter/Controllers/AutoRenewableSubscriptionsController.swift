//
//  AutoRenewableSubscriptionsController.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 13/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit
import TinyConstraints
import MerchantKit

class AutoRenewableSubscriptionsController: CollectionViewController, PurchaseCellDelegate, AutoRenewableSubscriptionsHeaderDelegate {
    
    // MARK: -
    // MARK: AutoRenewableSubscriptionsHeaderDelegate
    
    func goToAutoRenewableSubscription1(userInfo: [String : Any]?) {
//        guard let state = RebeloperStore.fetchSubscriptionState(for: autoRenewableSubscriptionGroup1IDs, automaticallyRenews: true) else { return }
//
//        switch state {
//        case .unknown:
//            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Subscription status unknown")
//        case .isPurchased(let info):
//            let content = AutoRenewableSubscritpionContent1()
//            content.purchasedProductInfo = info
//            self.navigationController?.pushViewController(content, animated: true)
//        case .notPurchased:
//            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "You are not subscribed")
//        }
    }

    func goToAutoRenewableSubscription2(userInfo: [String : Any]?) {
//        guard let state = RebeloperStore.fetchSubscriptionState(for: autoRenewableSubscriptionGroup2IDs, automaticallyRenews: true) else { return }
//
//        switch state {
//        case .unknown:
//            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "Subscription status unknown")
//        case .isPurchased(let info):
//            let content = AutoRenewableSubscritpionContent2()
//            content.purchasedProductInfo = info
//            self.navigationController?.pushViewController(content, animated: true)
//        case .notPurchased:
//            RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "You are not subscribed")
//        }
    }

    func cancelSubscription(userInfo: [String : Any]?) {
//        RebeloperStore.showCancelAutoRenewableSubscriptionsAlert()
    }
    
    // MARK: -
    // MARK: PurchaseCellDelegate
    
    func commitAutoRenewableSubscriptionPurchase(userInfo: [String : Any]?) {
//        guard let userInfo = userInfo, let purchase = userInfo[RebeloperStoreKey.UserInfo.purchase] as? Purchase else { return }
////        RebeloperStore.commitPurchase(purchase)
//        RebeloperStore.commitPurchase(purchase, isAutoRenewable: true) // prefered
    }
    
    // MARK: -
    // MARK: Header Composer Provider
    
    var headerComposer: ComposedHeaderProvider<AutoRenewableSubscriptionsHeader>!
    
    // MARK: -
    // MARK: Provider Elements for Section 1
    
//    lazy var dataSource = ArrayDataSource(data: RebeloperStore.fetchPurchases(for: .subscription(automaticallyRenews: true), order: .ascending) ?? []) // may be [] upon initialization because purchases may not be ready; see `setupNotificationCenterObservers` below
    lazy var viewSource = ClosureViewSource(viewUpdater: { (view: PurchaseCell, data: Purchase, index: Int) in
        view.delegate = self
        view.purchaseType = .subscription(automaticallyRenews: true)
        view.populate(with: data)
    })
    lazy var sizeSource = { (index: Int, data: Purchase, collectionSize: CGSize) -> CGSize in
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    // MARK: -
    // MARK: View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationCenterObservers()
        setupViews()
        setupProvider()
        setupNavBarItems()
    }
    
    // MARK: -
    // MARK: Setup
    
    fileprivate func setupViews() {
        navigationItem.title = "Auto-renewable Subscriptions"
    }
    
    fileprivate func setupNotificationCenterObservers() {
        NotificationCenter.default.addObserver(forName: notificationNameReloadProductsUI, object: nil, queue: OperationQueue.main) { (notification) in
//            self.dataSource.data = RebeloperStore.fetchPurchases(for: .subscription(automaticallyRenews: true), order: .ascending) ?? []
        }
    }
    
    fileprivate func setupProvider() {
//
//        // create a provider for the section 1
//        let section1Provider = BasicProvider(
//            dataSource: dataSource,
//            viewSource: viewSource,
//            sizeSource: sizeSource
//        )
//        
//        // create a sections provider with all the setcions
//        let sectionsProvider = ComposedProvider(sections: [section1Provider])
//        
//        // create a composed header provider so we may add the `headerViewSource` and `headerSizeSource` and `sections`
//        let composedProvider = ComposedHeaderProvider(
//            headerViewSource: ClosureViewSource(
//                viewUpdater: { (view: AutoRenewableSubscriptionsHeader, data, index) in
//                    view.delegate = self
//                    view.populate()
//            }),
//            headerSizeSource: { (index, data, maxSize) -> CGSize in
//                return CGSize(width: maxSize.width, height: 290)
//        },
//            sections: sectionsProvider.sections
//        )
//        
//        // so we may access the headerComposer outside of this scope if we need to; for example accessing its `isSticky` property
//        headerComposer = composedProvider
//        // set the `provider` to be newly created `composedProvider`
//        provider = composedProvider
//        
//        // set the header to be sticky
//        setHeaderSticky(false)
//        
    }
    
    func setHeaderSticky(_ value: Bool) {
        headerComposer.isSticky = value
    }
    
    func setupNavBarItems() {
        let restorePurchasesButtonItem = UIBarButtonItem(image: UIImage(named: "NavigationBarItemRestorePurchases")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleRestorePurchasesBarButtonItemTapped))
        navigationItem.setRightBarButtonItems([restorePurchasesButtonItem], animated: false)
    }
    
    @objc func handleRestorePurchasesBarButtonItemTapped() {
//        RebeloperStore.restorePurchases()
    }
    
}


