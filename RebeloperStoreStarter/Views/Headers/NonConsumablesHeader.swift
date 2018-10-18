//
//  NonConsumablesHeader.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 10/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

protocol NonConsumablesHeaderDelegate {
    func goToNextLevel(userInfo: [String: Any]?)
}

class NonConsumablesHeader: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: NonConsumablesHeaderDelegate?
    
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
        container.addSubview(bannerAdContainerView)
        bannerAdContainerView.addSubview(bannerAdStatusLabel)
        bannerAdContainerView.addSubview(bannerAdImageView)
        container.addSubview(goToNextLevelButton)
        
        container.edgesToSuperview(usingSafeArea: true)
        bannerAdContainerView.edgesToSuperview(excluding: .bottom)
        bannerAdContainerView.height(70)
        bannerAdStatusLabel.edges(to: bannerAdContainerView)
        bannerAdImageView.edges(to: bannerAdContainerView)
        goToNextLevelButton.edgesToSuperview(excluding: .top, insets: .bottom(10) + .left(10) + .right(10))
        goToNextLevelButton.height(50)
        
    }
    
    // MARK: -
    // MARK: Views
    
    lazy var container: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var bannerAdContainerView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var bannerAdImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "testBanner")?.withRenderingMode(.alwaysOriginal)
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var bannerAdStatusLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .center
        return label
    }()
    
    lazy var goToNextLevelButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Go to Next Level", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonSecondary
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleGoToNextLevelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleGoToNextLevelButtonTapped() {
        delegate?.goToNextLevel(userInfo: nil)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate() {
//        guard let product = RebeloperStore.fetchProduct(with: NonConsumableID.product2.rawValue, kind: .nonConsumable),
//            let isProductPurchased = RebeloperStore.fetchPurchasedState(for: product) else { return }
//        if isProductPurchased {
//            bannerAdImageView.alpha = 0.0
//            bannerAdStatusLabel.text = "Purchased. Banner ad is removed!"
//        } else {
//            bannerAdImageView.alpha = 1.0
//            bannerAdStatusLabel.text = ""
//        }
//    }
}

