//
//  VirtualGoodsHeader.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 15/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

protocol VirtualGoodsHeaderDelegate {
    func consumeConsumableVirtualGood(userInfo: [String: Any]?)
}

class VirtualGoodsHeader: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: VirtualGoodsHeaderDelegate?
    
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
        addSubview(coinCountLabel)
        
        addSubview(gemImageView)
        addSubview(gemCountLabel)
        
        addSubview(bombImageView)
        addSubview(bombCountLabel)
        
        addSubview(swordImageView)
        addSubview(swordCountLabel)
        
        addSubview(helmetImageView)
        addSubview(helmetCountLabel)
        
        addSubview(consumeConsumableVirtualGoodButton)
        
        coinImageView.topToSuperview(offset: 16, usingSafeArea: true)
        coinImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        coinImageView.width(30)
        coinImageView.height(30)
        coinCountLabel.topToSuperview(offset: 16, usingSafeArea: true)
        coinCountLabel.rightToLeft(of: coinImageView, offset: -8)
        coinCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        coinCountLabel.height(30)
        
        gemImageView.topToBottom(of: coinImageView, offset: 6)
        gemImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        gemImageView.width(30)
        gemImageView.height(30)
        gemCountLabel.topToBottom(of: coinImageView, offset: 6)
        gemCountLabel.rightToLeft(of: gemImageView, offset: -8)
        gemCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        gemCountLabel.height(30)
        
        bombImageView.topToBottom(of: gemImageView, offset: 6)
        bombImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        bombImageView.width(30)
        bombImageView.height(30)
        bombCountLabel.topToBottom(of: gemImageView, offset: 6)
        bombCountLabel.rightToLeft(of: bombImageView, offset: -8)
        bombCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        bombCountLabel.height(30)
        
        swordImageView.topToBottom(of: bombImageView, offset: 6)
        swordImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        swordImageView.width(30)
        swordImageView.height(30)
        swordCountLabel.topToBottom(of: bombImageView, offset: 6)
        swordCountLabel.rightToLeft(of: swordImageView, offset: -8)
        swordCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        swordCountLabel.height(30)
        
        helmetImageView.topToBottom(of: swordImageView, offset: 6)
        helmetImageView.rightToSuperview(offset: -16, usingSafeArea: true)
        helmetImageView.width(30)
        helmetImageView.height(30)
        helmetCountLabel.topToBottom(of: swordImageView, offset: 6)
        helmetCountLabel.rightToLeft(of: helmetImageView, offset: -8)
        helmetCountLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        helmetCountLabel.height(30)
        
        consumeConsumableVirtualGoodButton.edgesToSuperview(excluding: .top, insets: .bottom(10) + .left(10) + .right(10))
        consumeConsumableVirtualGoodButton.height(50)
    }
    
    // MARK: -
    // MARK: Views
    
    lazy var coinImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "coin")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var coinCountLabel: UILabel = {
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
    
    lazy var bombImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "bomb")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var bombCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .right
        return label
    }()
    
    lazy var swordImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "sword")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var swordCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .right
        return label
    }()
    
    lazy var helmetImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "helmet")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    lazy var helmetCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .right
        return label
    }()
    
    lazy var consumeConsumableVirtualGoodButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Use Bomb", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(Setup.Color.fontMain, for: .normal)
        button.backgroundColor = Setup.Color.buttonTernary
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleConsumeConsumableVirtualGoodButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleConsumeConsumableVirtualGoodButton() {
        delegate?.consumeConsumableVirtualGood(userInfo: nil)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate() {
//        guard let coinAmount = RebeloperStore.getVirtualCurrencyAmount(.primaryVirtualCurrency) else { return }
//        coinCountLabel.text = "\(coinAmount)"
//        guard let gemAmount = RebeloperStore.getVirtualCurrencyAmount(.secondaryVirtualCurrency) else { return }
//        gemCountLabel.text = "\(gemAmount)"
//        guard let bombAmount = RebeloperStore.getVirtualGoodAmount(.purchase2) else { return }
//        bombCountLabel.text = "\(bombAmount)"
//        guard let swordAmount = RebeloperStore.getVirtualGoodAmount(.purchase1) else { return }
//        swordCountLabel.text = "\(swordAmount)"
//        guard let helmetAmount = RebeloperStore.getVirtualGoodAmount(.purchase3) else { return }
//        helmetCountLabel.text = "\(helmetAmount)"
//    }
}


