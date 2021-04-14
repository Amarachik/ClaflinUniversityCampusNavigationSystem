//
//  BookStoreCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class BookStoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var BookStoreLabel: UILabel!
    @IBOutlet weak var BKImageDescriptions: UILabel!
    
    var BookStoreSlide: BookStoreClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let BookStoreSlide = BookStoreSlide {
                featuredImageView.image = BookStoreSlide.featuredImage
                
            backgroundColorView.backgroundColor = BookStoreSlide.color
         //   writingCenterLabel.text = writingCenter.title
            BKImageDescriptions.text = BookStoreSlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
            BKImageDescriptions.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
    
}
