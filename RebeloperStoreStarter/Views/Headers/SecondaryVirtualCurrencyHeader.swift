//
//  SecondaryVirtualCurrencyHeader.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 14/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

class SecondaryVirtualCurrencyHeader: UIView {
    
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
        
        addSubview(coinImageView)
        addSubview(countLabel)
        addSubview(gemImageView)
        addSubview(gemCountLabel)
        
        coinImageView.topToSuperview(offset: 16, usingSafeArea: true)
        coinImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        coinImageView.width(30)
        coinImageView.height(30)
        countLabel.topToSuperview(offset: 16, usingSafeArea: true)
        countLabel.rightToLeft(of: coinImageView, offset: -8)
        countLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        countLabel.height(30)
        
        gemImageView.topToBottom(of: coinImageView, offset: 6)
        gemImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        gemImageView.width(30)
        gemImageView.height(30)
        gemCountLabel.topToBottom(of: coinImageView, offset: 6)
        gemCountLabel.rightToLeft(of: gemImageView, offset: -8)
        gemCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        gemCountLabel.height(30)
    }
    
    // MARK: -
    // MARK: Views
    
    lazy var coinImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "coin")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var countLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .right
        return label
    }()
    
    lazy var gemImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "gem")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var gemCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .right
        return label
    }()
    
    // MARK: -
    // MARK: Handlers
    
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate() {
//        guard let amount = RebeloperStore.getVirtualCurrencyAmount(.primaryVirtualCurrency),
//            let gemAmount = RebeloperStore.getVirtualCurrencyAmount(.secondaryVirtualCurrency) else { return }
//        countLabel.text = "\(amount)"
//        gemCountLabel.text = "\(gemAmount)"
//    }
}

