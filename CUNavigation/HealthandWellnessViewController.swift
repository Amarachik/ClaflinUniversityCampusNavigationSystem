//
//  HealthandWellnessViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 11/22/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class HealthandWellnessViewController: UIViewController {
    
    @IBOutlet weak var HCenterBtn: UIButton!
    @IBOutlet weak var JTKGymBtn: UIButton!
    @IBOutlet weak var HWCollectionView: UICollectionView!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var headerView: UIView!
    
    func addBottomBorders() {
       let thickness: CGFloat = 3.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        
        HCenterBtn.layer.cornerRadius = 7.0
        HCenterBtn.layer.borderWidth = 2
        HCenterBtn.layer.borderColor = UIColor(red:18/255, green:191/255, blue:204/255, alpha: 1).cgColor
        HCenterBtn.layer.masksToBounds = true
        
        JTKGymBtn.layer.cornerRadius = 7.0
        JTKGymBtn.layer.borderWidth = 2
        JTKGymBtn.layer.borderColor = UIColor(red:118/255, green:169/255, blue:219/255, alpha: 1).cgColor
        JTKGymBtn.layer.masksToBounds = true
    }
}
