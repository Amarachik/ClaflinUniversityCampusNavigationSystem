//
//  AcademicDevelopmentCategoryViewController.swift
//  CUNavigation
//
//  Created by Amarachi C. Kalu-Onuma on 11/5/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class AcademicDevelopmentCategoryViewController: UIViewController {
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var WCBtn: UIButton!
    @IBOutlet weak var FCBtn: UIButton!
    @IBOutlet weak var SSSBtn: UIButton!
    @IBOutlet weak var CDBtn: UIButton!
    @IBOutlet weak var ASCBtn: UIButton!
    
    //testing
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
        WCBtn.layer.cornerRadius = 7.0
        WCBtn.layer.borderWidth = 2
        WCBtn.layer.borderColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
        WCBtn.layer.masksToBounds = true
        
        FCBtn.layer.cornerRadius = 7.0
        FCBtn.layer.borderWidth = 2
        FCBtn.layer.borderColor = UIColor(red:27/255, green:108/255, blue:162/255, alpha: 1).cgColor
        FCBtn.layer.masksToBounds = true
        
        SSSBtn.layer.cornerRadius = 7.0
        SSSBtn.layer.borderWidth = 2
        SSSBtn.layer.borderColor = UIColor(red:117/255, green:171/255, blue:219/255, alpha: 1).cgColor
        SSSBtn.layer.masksToBounds = true
        
        CDBtn.layer.cornerRadius = 7.0
        CDBtn.layer.borderWidth = 2
        CDBtn.layer.borderColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
        CDBtn.layer.masksToBounds = true
        
        ASCBtn.layer.cornerRadius = 7.0
        ASCBtn.layer.borderWidth = 2
        ASCBtn.layer.borderColor = UIColor(red:8/255, green:98/255, blue:157/255, alpha: 1).cgColor
        ASCBtn.layer.masksToBounds = true
    
    }
}
