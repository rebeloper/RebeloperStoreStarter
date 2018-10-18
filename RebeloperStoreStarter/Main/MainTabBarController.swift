//
//  MainTabBarController.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 25/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.index(of: viewController)
        if index == 4 {
            let virtualGoodsAlertAction = UIAlertAction(title: "Virtual Goods", style: .default) { (action) in
                let controller = VirtualGoodsController()
                let navController = UINavigationController(rootViewController: controller)
                self.present(navController, animated: true, completion: nil)
            }
            let secondaryVirtualCurrencyAlertAction = UIAlertAction(title: "Secondary Virtual Currency", style: .default) { (action) in
                let controller = SecondaryVirtualCurrencyController()
                let navController = UINavigationController(rootViewController: controller)
                self.present(navController, animated: true, completion: nil)
            }
            let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // go
            }
            RebeloperStoreService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [virtualGoodsAlertAction, secondaryVirtualCurrencyAlertAction, cancelAlertAction], completion: nil)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.delegate = self
        
        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        
        let consumablesController = ConsumablesController()
        let consumablesNavController = UINavigationController(rootViewController: consumablesController)
        consumablesController.tabBarItem.image = UIImage(named: "MainTabBarConsumable")?.withRenderingMode(.alwaysTemplate)
        consumablesController.tabBarItem.selectedImage = UIImage(named: "MainTabBarConsumable")?.withRenderingMode(.alwaysTemplate)
        
        let nonConsumablesController = NonConsumablesController()
        let nonConsumablesNavController = UINavigationController(rootViewController: nonConsumablesController)
        nonConsumablesController.tabBarItem.image = UIImage(named: "MainTabBarNonConsumable")?.withRenderingMode(.alwaysTemplate)
        nonConsumablesController.tabBarItem.selectedImage = UIImage(named: "MainTabBarNonConsumable")?.withRenderingMode(.alwaysTemplate)
        
        let autoRenewableSubscriptionController = AutoRenewableSubscriptionsController()
        let autoRenewableSubscriptionNavController = UINavigationController(rootViewController: autoRenewableSubscriptionController)
        autoRenewableSubscriptionController.tabBarItem.image = UIImage(named: "MainTabBarAutoRenewableSubscription")?.withRenderingMode(.alwaysTemplate)
        autoRenewableSubscriptionController.tabBarItem.selectedImage = UIImage(named: "MainTabBarAutoRenewableSubscription")?.withRenderingMode(.alwaysTemplate)
        
        let nonRenewableSubscriptionController = NonRenewableSubscriptionsController()
        let nonRenewableSubscriptionNavController = UINavigationController(rootViewController: nonRenewableSubscriptionController)
        nonRenewableSubscriptionController.tabBarItem.image = UIImage(named: "MainTabBarNonRenewableSubscription")?.withRenderingMode(.alwaysTemplate)
        nonRenewableSubscriptionController.tabBarItem.selectedImage = UIImage(named: "MainTabBarNonRenewableSubscription")?.withRenderingMode(.alwaysTemplate)
        
        let virtualCurrencyController = DummyVirtualCurrencyController()
        let virtualCurrencyNavController = UINavigationController(rootViewController: virtualCurrencyController)
        virtualCurrencyController.tabBarItem.image = UIImage(named: "MainTabBarVirtualCurrency")?.withRenderingMode(.alwaysTemplate)
        virtualCurrencyController.tabBarItem.selectedImage = UIImage(named: "MainTabBarVirtualCurrency")?.withRenderingMode(.alwaysTemplate)
        
        viewControllers = [consumablesNavController, nonConsumablesNavController, autoRenewableSubscriptionNavController, nonRenewableSubscriptionNavController, virtualCurrencyNavController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
