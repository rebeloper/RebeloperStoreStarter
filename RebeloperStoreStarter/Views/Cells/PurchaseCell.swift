//
//  PurchaseCell.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 10/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints
import MerchantKit

protocol PurchaseCellDelegate {
    func commitConsumablePurchase(userInfo: [String: Any]?)
    func commitNonConsumablePurchase(userInfo: [String: Any]?)
    func commitAutoRenewableSubscriptionPurchase(userInfo: [String: Any]?)
    func commitNonRenewableSubscriptionPurchase(userInfo: [String: Any]?)
    func commitVirtualCurrencyPurchase(userInfo: [String: Any]?)
    func commitVirtualGoodPurchase(userInfo: [String: Any]?)
}

extension PurchaseCellDelegate {
    func commitConsumablePurchase(userInfo: [String: Any]?) {}
    func commitNonConsumablePurchase(userInfo: [String: Any]?) {}
    func commitAutoRenewableSubscriptionPurchase(userInfo: [String: Any]?) {}
    func commitNonRenewableSubscriptionPurchase(userInfo: [String: Any]?) {}
    func commitVirtualCurrencyPurchase(userInfo: [String: Any]?) {}
    func commitVirtualGoodPurchase(userInfo: [String: Any]?) {}
}

class PurchaseCell: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: PurchaseCellDelegate?
    
    // MARK: -
    // MARK: Data
    
    var purchase: Purchase?
    var purchaseType: Product.Kind?
//    var virtualCurrencyPurchase: VirtualCurrencyPurchase?
//    var virtualGoodPurchase: VirtualGoodPurchase?
    
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
        
        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(descriptionLabel)
        container.addSubview(purchaseButton)
        
        container.edgesToSuperview(insets: .top(8) + .left(8) + .bottom(-8) + .right(-8), usingSafeArea: true)
        titleLabel.edges(to: container, excluding: .bottom, insets: .top(10) + .left(10) + .right(-10))
        titleLabel.height(24)
        descriptionLabel.topToBottom(of: titleLabel, offset: 6)
        descriptionLabel.bottomToTop(of: purchaseButton, offset: -6)
        descriptionLabel.rightToSuperview(offset: -18)
        descriptionLabel.leftToSuperview(offset: 18)
        purchaseButton.edgesToSuperview(excluding: .top, insets: .bottom(18) + .right(18) + .left(18))
        purchaseButton.height(50)
    }
    
    // MARK: -
    // MARK: Views
    
    lazy var container: UIView = {
        var view = UIView()
        view.backgroundColor = Setup.Color.main
        view.layer.cornerRadius = 21
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = Setup.Color.fontMain
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Setup.Color.fontSecondary
        label.numberOfLines = 0
        return label
    }()
    
    lazy var purchaseButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonMain
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handlePurchaseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handlePurchaseButtonTapped() {
        
        if let purchase = purchase, let purchaseType = purchaseType {
            let userInfo = [RebeloperStoreKey.UserInfo.purchase: purchase]
            
            switch purchaseType {
            case .consumable:
                delegate?.commitConsumablePurchase(userInfo: userInfo)
            case .nonConsumable:
                delegate?.commitNonConsumablePurchase(userInfo: userInfo)
            case .subscription(automaticallyRenews: true):
                delegate?.commitAutoRenewableSubscriptionPurchase(userInfo: userInfo)
            case .subscription(automaticallyRenews: false):
                delegate?.commitNonRenewableSubscriptionPurchase(userInfo: userInfo)
            }
            
        }
        
//        if let virtualCurrencyPurchase = virtualCurrencyPurchase {
//            let userInfo = [RebeloperStoreKey.UserInfo.purchase: virtualCurrencyPurchase]
//            delegate?.commitVirtualCurrencyPurchase(userInfo: userInfo)
//        }
        
//        if let virtualGoodPurchase = virtualGoodPurchase {
//            let userInfo = [RebeloperStoreKey.UserInfo.purchase: virtualGoodPurchase]
//            delegate?.commitVirtualGoodPurchase(userInfo: userInfo)
//        }
        
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
    func populate(with purchase: Purchase) {
        
        self.purchase = purchase
        
//        titleLabel.text = purchase.localizedTitle
//        descriptionLabel.text = purchase.localizedDescription
        let priceFormater = PriceFormatter()
        priceFormater.freeReplacementText = "FREE"
        priceFormater.prefix = "Only "
        let price = purchase.price
        purchaseButton.setTitle(priceFormater.string(from: price), for: .normal)
    }
    
//    func populate(with virtualCurrencyPurchase: VirtualCurrencyPurchase) {
//
//        self.virtualCurrencyPurchase = virtualCurrencyPurchase
//
//        titleLabel.text = virtualCurrencyPurchase.title
//        descriptionLabel.text = virtualCurrencyPurchase.description
//        purchaseButton.setTitle(virtualCurrencyPurchase.virtualCurrencyBuyButtonText, for: .normal)
//    }
//
//    func populate(with virtualGoodPurchase: VirtualGoodPurchase) {
//
//        self.virtualGoodPurchase = virtualGoodPurchase
//
//        titleLabel.text = virtualGoodPurchase.title
//        descriptionLabel.text = virtualGoodPurchase.description
//
//        RebeloperStore.getVirtualGoodPurchaseButtonTitle(virtualGoodPurchase) { (title) in
//            DispatchQueue.main.async {
//                self.purchaseButton.setTitle(title, for: .normal)
//            }
//        }
//    }
    
}
