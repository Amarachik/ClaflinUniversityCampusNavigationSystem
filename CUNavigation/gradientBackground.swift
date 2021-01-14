//
//  gradientBackground.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/6/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func setTwoGradient(colorOne: UIColor, colorTwo: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y:0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
