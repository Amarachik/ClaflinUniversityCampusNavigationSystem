//
//  HealthWellnessClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/25/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class HealthWellnessClass {
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [HealthWellnessClass] {
        return [
            HealthWellnessClass(featuredImage: UIImage(named: "JTKFront")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: "Health and Wellness Center"),
            HealthWellnessClass(featuredImage: UIImage(named: "Gymnasium")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "CU Gymnasium"),
            HealthWellnessClass(featuredImage: UIImage(named: "indoorTrack")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: "CU Indoor Track"),
            HealthWellnessClass(featuredImage: UIImage(named: "basketballCourt2")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "CU BasketBall Court"),
            HealthWellnessClass(featuredImage: UIImage(named: "Terrence_Bowman")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "CU BasketBall Court"),

        ]
    }
}
