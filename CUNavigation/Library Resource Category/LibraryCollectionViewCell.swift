//
//  LibraryCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var LibraryImageDescription: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    var LibrarySlide: LibraryClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let LibrarySlide = LibrarySlide{
                featuredImageView.image = LibrarySlide.featuredImage
                
            backgroundColorView.backgroundColor = LibrarySlide.color
         //   writingCenterLabel.text = writingCenter.title
            LibraryImageDescription.text = LibrarySlide.title
            } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
           // writingCenterLabel.text = nil
                LibraryImageDescription.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
