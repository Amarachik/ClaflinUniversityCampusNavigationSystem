//
//  CareerDevClass.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/28/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI

class CareerDevClass {
    
    var featuredImage: UIImage
    var color: UIColor
    var title = ""
    
    init(featuredImage: UIImage, color: UIColor, title: String){
        self.featuredImage = featuredImage
        self.color = color
        self.title = title
    }
    
    static func fetchWriting() -> [CareerDevClass] {
        return [
            CareerDevClass(featuredImage: UIImage(named: "CareerDevWelcome")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.7), title: "            Reception"),
            CareerDevClass(featuredImage: UIImage(named: "CareerDevLobby")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.7), title: "Computer Lab Room"),
            CareerDevClass(featuredImage: UIImage(named: "CareerOpportunities")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.7), title: "Intership Opportunities"),
            CareerDevClass(featuredImage: UIImage(named: "CareerOffice")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.7), title: "Workforce Specialist Office"),
        ]
    }
}
