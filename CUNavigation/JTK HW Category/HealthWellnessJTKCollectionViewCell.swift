//
//  HealthWellnessJTKCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/25/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class HealthWellnessJTKCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var HWImageDescription: UILabel!
    @IBOutlet weak var backgroundColorView: HealthWellnessJTKCollectionViewCell!
    
    var HealthWellnessSlide: HealthWellnessClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let HealthWellnessSlide = HealthWellnessSlide {
                featuredImageView.image = HealthWellnessSlide.featuredImage
                
            backgroundColorView.backgroundColor = HealthWellnessSlide.color
         //   writingCenterLabel.text = writingCenter.title
            HWImageDescription.text = HealthWellnessSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
                HWImageDescription.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
    
}


