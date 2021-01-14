//
//  BookStoreClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class BookStoreClass {
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [BookStoreClass] {
        return [
            BookStoreClass(featuredImage: UIImage(named: "BK1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: "CU Clothing Apparel "),
            BookStoreClass(featuredImage: UIImage(named: "BK3")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "BookStore Hallway "),
            BookStoreClass(featuredImage: UIImage(named: "BK4")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: "CU Book Collection "),
            BookStoreClass(featuredImage: UIImage(named: "BK2")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: " "),
        ]
    }
}
