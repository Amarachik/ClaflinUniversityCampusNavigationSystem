//
//  FreshmanCollegeClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class FreshmanCollegeClass {
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [FreshmanCollegeClass] {
        return [
            FreshmanCollegeClass(featuredImage: UIImage(named: "FRCollege")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: " "),
            FreshmanCollegeClass(featuredImage: UIImage(named: "FC")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "Writing Center Room"),
            FreshmanCollegeClass(featuredImage: UIImage(named: "write-a-short-story-or-any-body-of-writing")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: " "),
            FreshmanCollegeClass(featuredImage: UIImage(named: "WC2")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "Writing Center Room"),
        ]
    }
}
