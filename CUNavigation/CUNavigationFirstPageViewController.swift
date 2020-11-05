//
//  CUNavigationFirstPageViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 10/20/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class CUNavigationFirstPageViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var ExploreLabel: UILabel!
    @IBOutlet var AcademicDevelopmentRoundedIcon: UIImageView!
    @IBOutlet var ResourcesRoundedIcon: UIImageView!
    @IBOutlet var StudentAccountsRoundedIcon: UIImageView!
    @IBOutlet var HealthWellnessRoundedIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Rounds the icons on the First Storyboard
        AcademicDevelopmentRoundedIcon.layer.cornerRadius = 30
        AcademicDevelopmentRoundedIcon.clipsToBounds = true
        ResourcesRoundedIcon.layer.cornerRadius = 30
        ResourcesRoundedIcon.clipsToBounds = true
        StudentAccountsRoundedIcon.layer.cornerRadius = 30
        StudentAccountsRoundedIcon.clipsToBounds = true
        HealthWellnessRoundedIcon.layer.cornerRadius = 30
        HealthWellnessRoundedIcon.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
