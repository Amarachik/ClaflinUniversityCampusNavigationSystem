//
//  ASCCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 2/15/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class ASCCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var ASCImageDescription: UILabel!
    
    var ASCSlide: ASCClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let ASCSlide = ASCSlide{
                featuredImageView.image = ASCSlide.featuredImage
                
            backgroundColorView.backgroundColor = ASCSlide.color
         //   writingCenterLabel.text = writingCenter.title
            ASCImageDescription.text = ASCSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
                ASCImageDescription.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
