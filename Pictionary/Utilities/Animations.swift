//
//  Animations.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 06/03/21.
//  Copyright © 2021 none. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    
    func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.1
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
}
