//
//  NonRenewableSubscriptionsHeader.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 14/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

protocol NonRenewableSubscriptionsHeaderDelegate {
    func goToNonRenewableSubscription1(userInfo: [String: Any]?)
}

class NonRenewableSubscriptionsHeader: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: NonRenewableSubscriptionsHeaderDelegate?
    
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
        
        container.edgesToSuperview(usingSafeArea: true)
        goToSubscription1Button.edgesToSuperview(excluding: .bottom, insets: .top(10) + .left(10) + .right(10))
        goToSubscription1Button.height(50)
        
        subscription1StatusLabel.topToBottom(of: goToSubscription1Button, offset: 6)
        subscription1StatusLabel.leftToSuperview(offset: 16)
        subscription1StatusLabel.rightToSuperview(offset: -16)
        
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
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleGoToSubscription1ButtonTapped() {
        delegate?.goToNonRenewableSubscription1(userInfo: nil)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate() {
//        if let product = RebeloperStore.fetchProduct(with: NonRenewableSubscriptionID.group1_subscription1.rawValue, kind: .subscription(automaticallyRenews: false)),
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
//    }
}



