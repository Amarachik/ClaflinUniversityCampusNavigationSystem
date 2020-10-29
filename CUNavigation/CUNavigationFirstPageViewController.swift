//
//  CUNavigationFirstPageViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 10/20/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit
import GoogleMaps

class CUNavigationFirstPageViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var ExploreLabel: UILabel!
    @IBOutlet var AcademicDevelopmentRoundedIcon: UIImageView!
    @IBOutlet var ResourcesRoundedIcon: UIImageView!
    @IBOutlet var StudentAccountsRoundedIcon: UIImageView!
    @IBOutlet var HealthWellnessRoundedIcon: UIImageView!
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: -33.49, longitude: 80.85, zoom: 1.0)
//        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//                self.view.addSubview(mapView)
        mapView.camera = camera
                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.49, longitude: 80.85)
                marker.title = "Orangeburg"
                marker.snippet = "South Carolina"
                marker.map = mapView
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

//Rounds the icons on the First Storyboard
/*     AcademicDevelopmentRoundedIcon.layer.cornerRadius = AcademicDevelopmentRoundedIcon.frame.height/2
AcademicDevelopmentRoundedIcon.layer.masksToBounds = false
AcademicDevelopmentRoundedIcon.clipsToBounds = true
AcademicDevelopmentRoundedIcon.layer.borderWidth = 1

ResourcesRoundedIcon.layer.cornerRadius = 30
ResourcesRoundedIcon.clipsToBounds = true
StudentAccountsRoundedIcon.layer.cornerRadius = 30
StudentAccountsRoundedIcon.clipsToBounds = true
HealthWellnessRoundedIcon.layer.cornerRadius = 30
HealthWellnessRoundedIcon.clipsToBounds = true */
