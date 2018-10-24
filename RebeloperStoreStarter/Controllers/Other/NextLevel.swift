//
//  NextLevel.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 26/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

class NextLevel: UIViewController {
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = Setup.Color.fontSecondary
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = """
        Welcome to the Unlocked
        Next Level
        """
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Setup.Color.main
        
        view.addSubview(label)
        label.edgesToSuperview(usingSafeArea: true)
    }
}
