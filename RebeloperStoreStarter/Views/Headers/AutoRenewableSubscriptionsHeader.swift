//
//  AutoRenewableSubscriptionsHeader.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 14/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

protocol AutoRenewableSubscriptionsHeaderDelegate {
    func goToAutoRenewableSubscription1(userInfo: [String: Any]?)
    func goToAutoRenewableSubscription2(userInfo: [String: Any]?)
    func cancelSubscription(userInfo: [String: Any]?)
}

class AutoRenewableSubscriptionsHeader: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: AutoRenewableSubscriptionsHeaderDelegate?
    
    // MARK: -
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Common Init
    
    private func commonInit() {
        setupViews()
    }
    
    // MARK: -
    // MARK: Setup Views
    
    private func setupViews() {
        backgroundColor = Setup.Color.main
        
        addSubview(container)
        container.addSubview(goToSubscription1Button)
        container.addSubview(subscription1StatusLabel)
        container.addSubview(goToSubscription2Button)
        container.addSubview(subscription2StatusLabel)
        container.addSubview(cancelSubscriptionButton)
        
        container.edgesToSuperview(usingSafeArea: true)
        goToSubscription1Button.edgesToSuperview(excluding: .bottom, insets: .top(10) + .left(10) + .right(10))
        goToSubscription1Button.height(50)
        
        subscription1StatusLabel.topToBottom(of: goToSubscription1Button, offset: 6)
        subscription1StatusLabel.leftToSuperview(offset: 16)
        subscription1StatusLabel.rightToSuperview(offset: -16)
        
        goToSubscription2Button.topToBottom(of: subscription1StatusLabel, offset: 16)
        goToSubscription2Button.leftToSuperview(offset: 10)
        goToSubscription2Button.rightToSuperview(offset: -10)
        goToSubscription2Button.height(50)
        
        subscription2StatusLabel.topToBottom(of: goToSubscription2Button, offset: 6)
        subscription2StatusLabel.leftToSuperview(offset: 16)
        subscription2StatusLabel.rightToSuperview(offset: -16)
        
        cancelSubscriptionButton.topToBottom(of: subscription2StatusLabel, offset: 16)
        cancelSubscriptionButton.leftToSuperview(offset: 10)
        cancelSubscriptionButton.rightToSuperview(offset: -10)
        cancelSubscriptionButton.height(50)
    }
    
    // MARK: -
    // MARK: Views
    
    lazy var container: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var goToSubscription1Button: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonSecondary
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleGoToSubscription1ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var subscription1StatusLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Setup.Color.fontSecondary
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    lazy var goToSubscription2Button: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonSecondary
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleGoToSubscription2ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var subscription2StatusLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Setup.Color.fontSecondary
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    lazy var cancelSubscriptionButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Cancel Subscription", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonTernary
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleCancelSubscriptionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleGoToSubscription1ButtonTapped() {
        delegate?.goToAutoRenewableSubscription1(userInfo: nil)
    }
    
    @objc func handleGoToSubscription2ButtonTapped() {
        delegate?.goToAutoRenewableSubscription2(userInfo: nil)
    }
    
    @objc func handleCancelSubscriptionButtonTapped() {
        delegate?.cancelSubscription(userInfo: nil)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate() {
//        if let product = RebeloperStore.fetchProduct(with: AutoRenewableSubscriptionID.group1_subscription1.rawValue, kind: .subscription(automaticallyRenews: true)),
//            let state = RebeloperStore.fetchSubscriptionState(for: product) {
//            
//            if let purchase = RebeloperStore.fetchPurchase(for: product) {
//                goToSubscription1Button.setTitle("\(purchase.localizedTitle)", for: .normal)
//            } else {
//                goToSubscription1Button.setTitle("Drink Coffee", for: .normal)
//            }
//            
//            switch state {
//            case .unknown:
//                subscription1StatusLabel.text = "Subscription status unknown"
//            case .isPurchased(let info):
//                
//                if let expiryDate = info.expiryDate {
//                    let expiryDateString = expiryDate.asString(style: DateFormatter.Style.full)
//                    let duration: TimeInterval = expiryDate.timeIntervalSince1970 - Date().timeIntervalSince1970
//                    subscription1StatusLabel.text = """
//                    Expires in: \(duration.asDays())
//                    Expiry Date: \(expiryDateString)
//                    """
//                } else {
//                    subscription1StatusLabel.text = """
//                    Expires in: N/A
//                    Expiry Date: N/A
//                    """
//                }
//                
//            case .notPurchased:
//                if let purchase = RebeloperStore.fetchPurchase(for: product) {
//                    subscription1StatusLabel.text = """
//                    Not subscribed to '\(purchase.localizedTitle)'
//                    
//                    """
//                }
//            }
//        } else {
//            goToSubscription1Button.setTitle("Subscription 1", for: .normal)
//            subscription1StatusLabel.text = """
//            Expires in: N/A
//            Expiry Date: N/A
//            """
//        }
//        
//        if let product = RebeloperStore.fetchProduct(with: AutoRenewableSubscriptionID.group2_subscription1.rawValue, kind: .subscription(automaticallyRenews: true)),
//            let state = RebeloperStore.fetchSubscriptionState(for: product) {
//            
//            if let purchase = RebeloperStore.fetchPurchase(for: product) {
//                goToSubscription2Button.setTitle("\(purchase.localizedTitle)", for: .normal)
//            } else {
//                goToSubscription2Button.setTitle("Eat Donuts", for: .normal)
//            }
//            
//            switch state {
//            case .unknown:
//                subscription2StatusLabel.text = "Subscription status unknown"
//            case .isPurchased(let info):
//                
//                if let expiryDate = info.expiryDate {
//                    let expiryDateString = expiryDate.asString(style: DateFormatter.Style.full)
//                    let duration: TimeInterval = expiryDate.timeIntervalSince1970 - Date().timeIntervalSince1970
//                    subscription2StatusLabel.text = """
//                    Expires in: \(duration.asDays())
//                    Expiry Date: \(expiryDateString)
//                    """
//                } else {
//                    subscription2StatusLabel.text = """
//                    Expires in: N/A
//                    Expiry Date: N/A
//                    """
//                }
//                
//            case .notPurchased:
//                if let purchase = RebeloperStore.fetchPurchase(for: product) {
//                    subscription2StatusLabel.text = """
//                    Not subscribed to '\(purchase.localizedTitle)'
//                    
//                    """
//                }
//                
//            }
//        } else {
//            goToSubscription2Button.setTitle("Subscription 2", for: .normal)
//            subscription2StatusLabel.text = """
//            Expires in: N/A
//            Expiry Date: N/A
//            """
//        }
//    }
}


