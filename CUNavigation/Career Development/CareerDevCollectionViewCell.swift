//
//  CareerDevCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/28/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class CareerDevCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var CareerDevImageDescription: UILabel!
    
    var CareerDevSlide: CareerDevClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let CareerDevSlide = CareerDevSlide{
                featuredImageView.image = CareerDevSlide.featuredImage
                
            backgroundColorView.backgroundColor = CareerDevSlide.color
         //   writingCenterLabel.text = writingCenter.title
            CareerDevImageDescription.text = CareerDevSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
                CareerDevImageDescription.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
