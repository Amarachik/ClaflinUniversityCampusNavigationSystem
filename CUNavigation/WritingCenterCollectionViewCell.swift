//
//  WritingCenterCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi C. Kalu-Onuma on 11/13/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class WritingCenterCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var writingCenterLabel: UILabel!
    
    var writingCenter: WritingCenterClass! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let writingCenter = writingCenter {
            featuredImageView.image = writingCenter.featuredImage
            backgroundColorView.backgroundColor = writingCenter.color
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
