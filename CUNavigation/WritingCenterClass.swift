//
//  WritingCenterClass.swift
//  CUNavigation
//
//  Created by Amarachi C. Kalu-Onuma on 11/13/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class WritingCenterClass {
    
    var featuredImage: UIImage
    var color: UIColor
    
    init(featuredImage: UIImage, color: UIColor){
        self.featuredImage = featuredImage
        self.color = color
    }
    
    static func fetchWriting() -> [WritingCenterClass] {
        return [
            WritingCenterClass(featuredImage: UIImage(named: "write-a-short-story-or-any-body-of-writing")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)),
            WritingCenterClass(featuredImage: UIImage(named: "write-a-short-story-or-any-body-of-writing")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)),
            WritingCenterClass(featuredImage: UIImage(named: "write-a-short-story-or-any-body-of-writing")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)),
            WritingCenterClass(featuredImage: UIImage(named: "write-a-short-story-or-any-body-of-writing")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.8))
        ]
    }
}
