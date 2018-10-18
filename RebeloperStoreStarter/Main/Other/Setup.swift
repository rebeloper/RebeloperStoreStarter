//
//  Setup.swift
//  RebeloperStore
//
//  Created by Alex Nagy on 25/09/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit

let notificationNameGoToNextLevel = Notification.Name(rawValue: "goToNextLevel")
let notificationNameGoToAutoRenewableSubscription1 = Notification.Name(rawValue: "goToAutoRenewableSubscription1")
let notificationNameGoToAutoRenewableSubscription2 = Notification.Name(rawValue: "goToAutoRenewableSubscription2")
let notificationNameGoToNonRenewableSubscription1 = Notification.Name(rawValue: "goToNonRenewableSubscription1")

struct Setup {
    struct Color {
        static let background = UIColor(r: 47, g: 50, b: 57)
        static let main = UIColor(r: 41, g: 42, b: 48)
        static let fontMain = UIColor.white
        static let fontSecondary = UIColor(r: 161, g: 161, b: 161)
        static let buttonMain = UIColor(r: 0, g: 164, b: 83)
        static let buttonSecondary = UIColor(r: 68, g: 132, b: 209)
        static let buttonTernary = UIColor(r: 206, g: 47, b: 57)
        static let navigation = UIColor(r: 33, g: 34, b: 37)
        static let selected = UIColor(r: 68, g: 132, b: 209)
        static let unselected = UIColor(r: 161, g: 161, b: 161)
    }
}
