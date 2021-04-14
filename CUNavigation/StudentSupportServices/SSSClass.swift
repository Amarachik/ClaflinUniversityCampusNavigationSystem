//
//  SSSClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 2/25/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class SSSClass {
    //creating variables for SSS slide
    
    var featuredImage: UIImage
    var color: UIColor
    
    init(featuredImage: UIImage, color: UIColor){
        self.featuredImage = featuredImage
        self.color = color
    }
    
    static func fetchWriting() -> [SSSClass] {
        return [
            SSSClass(featuredImage: UIImage(named: "SSSImage")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7)),
            SSSClass(featuredImage: UIImage(named: "welcome")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7)),
            SSSClass(featuredImage: UIImage(named: "TRIO")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7)),
            SSSClass(featuredImage: UIImage(named: "TRioStudents")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7)),
        ]
    }
}
