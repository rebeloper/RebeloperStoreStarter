//
//  CollectionViewController.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 10/10/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit

class CollectionViewController: UIViewController {
    
    let collectionView = CollectionView()
    
    var provider: Provider? {
        get { return collectionView.provider }
        set { collectionView.provider = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Setup.Color.background
        
        view.addSubview(collectionView)
        collectionView.animator = FadeAnimator()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}
