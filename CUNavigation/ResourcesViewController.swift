//
//  ResourcesViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 11/22/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var LibraryBtn: UIButton!
    @IBOutlet weak var bkStoreBtn: UIButton!
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
        LibraryBtn.layer.cornerRadius = 7.0
        LibraryBtn.layer.borderWidth = 2
        LibraryBtn.layer.borderColor = UIColor(red:0/255, green:52/255, blue:94/255, alpha: 1).cgColor
        LibraryBtn.layer.masksToBounds = true
        
        bkStoreBtn.layer.cornerRadius = 7.0
        bkStoreBtn.layer.borderWidth = 2
        bkStoreBtn.layer.borderColor = UIColor(red:8/255, green:98/255, blue:156/255, alpha: 1).cgColor
        bkStoreBtn.layer.masksToBounds = true
    
    }
}
