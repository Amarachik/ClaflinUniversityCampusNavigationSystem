//
//  FreshmanCollegeCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class FreshmanCollegeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var freshmanCollegeLabel: UILabel!
    @IBOutlet weak var FCImageDescriptions: UILabel!
    
    var freshmanCollegeSlide: FreshmanCollegeClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let freshmanCollegeSlide = freshmanCollegeSlide {
                featuredImageView.image = freshmanCollegeSlide.featuredImage
                
            backgroundColorView.backgroundColor = freshmanCollegeSlide.color
         //   writingCenterLabel.text = writingCenter.title
            FCImageDescriptions.text = freshmanCollegeSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
            FCImageDescriptions.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}

