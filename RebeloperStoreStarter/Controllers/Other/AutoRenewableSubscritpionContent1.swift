//
//  AutoRenewableSubscritpionContent1.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 26/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints
import MerchantKit

class AutoRenewableSubscritpionContent1: UIViewController {
    
    var purchasedProductInfo: PurchasedProductInfo?
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .center
        label.numberOfLines = 0
        if let purchasedProductInfo = purchasedProductInfo,
            let expiryDate = purchasedProductInfo.expiryDate {
            let expiryDateString = expiryDate.asString(style: DateFormatter.Style.full)
            let duration: TimeInterval = expiryDate.timeIntervalSince1970 - Date().timeIntervalSince1970
            label.text = """
            Welcome to the Unlocked
            Auto-renewable
            Subscription Content 1
            
            Expires in:
            \(duration.asDays())
            
            Expiry Date:
            \(expiryDateString)
            """
        } else {
            label.text = """
            Welcome to the Unlocked
            Auto-renewable
            Subscription Content 1
            
            Expires in:
            N/A
            
            Expiry Date:
            N/A
            """
        }
        
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Setup.Color.main
        
        view.addSubview(label)
        label.edgesToSuperview(usingSafeArea: true)
    }
}
