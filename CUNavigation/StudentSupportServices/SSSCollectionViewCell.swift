//
//  SSSCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 2/15/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class SSSCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    
    var SSSSlide: SSSClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let SSSSlide = SSSSlide{
                featuredImageView.image = SSSSlide.featuredImage
                
            backgroundColorView.backgroundColor = SSSSlide.color

            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
