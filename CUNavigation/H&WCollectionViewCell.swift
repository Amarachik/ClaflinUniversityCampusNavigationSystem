//
//  H&WCollectionViewCell.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/3/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class H_WCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var HWLabel: UILabel!
    @IBOutlet weak var HWBackgroundView: UIView!
    
    func setup(with categories: HealthWellness){
        IconImageView.image = categories.image
        HWLabel.text = categories.title
    }
}
