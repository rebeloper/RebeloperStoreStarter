//
//  NonConsumablesController.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 10/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit
import TinyConstraints
import MerchantKit

class NonConsumablesController: CollectionViewController, PurchaseCellDelegate, NonConsumablesHeaderDelegate {
    
    // MARK: -
    // MARK: NonConsumablesHeaderDelegate
    
    func goToNextLevel(userInfo: [String : Any]?) {
//        guard let product = RebeloperStore.fetchProduct(with: NonConsumableID.product1.rawValue, kind: .nonConsumable),
//            let isProductPurchased = RebeloperStore.fetchPurchasedState(for: product) else { return }
//        
//        if isProductPurchased {
//            let nextLevel = NextLevel()
//            self.navigationController?.pushViewController(nextLevel, animated: true)
//        } else {
//            if let purchase = RebeloperStore.fetchPurchase(for: product) {
//                RebeloperStoreService.showAlert(style: .alert, title: "Error", message: "You must purchase '\(purchase.localizedTitle)' to access this content.")
//            }
//            
//        }
    }
    
    // MARK: -
    // MARK: PurchaseCellDelegate
    
    func commitNonConsumablePurchase(userInfo: [String : Any]?) {
        guard let userInfo = userInfo, let purchase = userInfo[RebeloperStoreKey.UserInfo.purchase] as? Purchase else { return }
//        RebeloperStore.commitPurchase(purchase)
    }
    
    // MARK: -
    // MARK: Header Composer Provider
    
    var headerComposer: ComposedHeaderProvider<NonConsumablesHeader>!
    
    // MARK: -
    // MARK: Provider Elements for Section 1
    
//    lazy var dataSource = ArrayDataSource(data: RebeloperStore.fetchPurchases(for: .nonConsumable, order: .ascending) ?? []) // may be [] upon initialization because purchases may not be ready; see `setupNotificationCenterObservers` below
    lazy var viewSource = ClosureViewSource(viewUpdater: { (view: PurchaseCell, data: Purchase, index: Int) in
        view.delegate = self
        view.purchaseType = .nonConsumable
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
        navigationItem.title = "Non-consumables"
    }
    
    fileprivate func setupNotificationCenterObservers() {
        NotificationCenter.default.addObserver(forName: notificationNameReloadProductsUI, object: nil, queue: OperationQueue.main) { (notification) in
//            self.dataSource.data = RebeloperStore.fetchPurchases(for: .nonConsumable, order: .ascending) ?? []
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
//                viewUpdater: { (view: NonConsumablesHeader, data, index) in
//                    view.delegate = self
//                    view.populate()
//            }),
//            headerSizeSource: { (index, data, maxSize) -> CGSize in
//                return CGSize(width: maxSize.width, height: 140)
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

