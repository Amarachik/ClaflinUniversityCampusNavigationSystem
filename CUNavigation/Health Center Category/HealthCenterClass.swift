//
//  HealthCenterClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/27/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class HealthCenterClass {
    
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [HealthCenterClass] {
        return [
            HealthCenterClass(featuredImage: UIImage(named: "StudentHealth")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: "Health and Wellness Center"),
            HealthCenterClass(featuredImage: UIImage(named: "Lobby")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "Health Center Lobby"),
            HealthCenterClass(featuredImage: UIImage(named: "CheckUpRoom")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: "Check Up Room"),
            HealthCenterClass(featuredImage: UIImage(named: "HealthRoom")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: " Check Up Room"),
            HealthCenterClass(featuredImage: UIImage(named: "ProtectU")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: " Check Up Room"),
        ]
    }

}
