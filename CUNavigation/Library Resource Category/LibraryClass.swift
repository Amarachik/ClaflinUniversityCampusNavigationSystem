//
//  LibraryClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class LibraryClass {
    
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [LibraryClass] {
        return [
            LibraryClass(featuredImage: UIImage(named: "libraryGround")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: "Library Study/ Tutoring Area"),
            LibraryClass(featuredImage: UIImage(named: "librarySitting")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "Open Sitting Area"),
            LibraryClass(featuredImage: UIImage(named: "libraryComp")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: "Student Meeting Section"),
            LibraryClass(featuredImage: UIImage(named: "library2nd")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "Library Book Collection"),
            LibraryClass(featuredImage: UIImage(named: "libraryComp-1")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "Computer Room"),
        ]
    }

}
