//
//  Extensions.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 25/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(r: r, g: g, b: b, a: 1)
    }
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
