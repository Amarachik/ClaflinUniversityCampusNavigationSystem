//
//  HealthCenterCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/27/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class HealthCenterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var HealthCenterImageDescription: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    var HealthCenterSlide: HealthCenterClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let HealthCenterSlide = HealthCenterSlide{
                featuredImageView.image = HealthCenterSlide.featuredImage
                
            backgroundColorView.backgroundColor = HealthCenterSlide.color
         //   writingCenterLabel.text = writingCenter.title
            HealthCenterImageDescription.text = HealthCenterSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
                HealthCenterImageDescription.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
    
}
