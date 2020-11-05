//
//  CUNavigationFirstPageViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 10/20/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import SwiftUI
import UIKit
import GoogleMaps
import CoreLocation

class CUNavigationFirstPageViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var ExploreLabel: UILabel!
    @IBOutlet var AcademicDevelopmentRoundedIcon: UIImageView!
    @IBOutlet var ResourcesRoundedIcon: UIImageView!
    @IBOutlet var StudentAccountsRoundedIcon: UIImageView!
    @IBOutlet var HealthWellnessRoundedIcon: UIImageView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBAction func ZoomInBtn(_ sender: Any) {
    }
    
    @IBAction func ZoomOutButton(_ sender: Any) {
    }
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkLocationServces()
        let camera = GMSCameraPosition.camera(withLatitude: 33.49969, longitude: -80.85405, zoom: 15)
        mapView.camera = camera
        mapView.mapType = .satellite
        mapView.settings.compassButton = true
        mapView.animate(toZoom: 17)
            
            //Labels all buildings on campus with a marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 33.49897, longitude: -80.85424)
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.title = "James S. Thomas Science Center (JST)"
   /*     marker.snippet = "James S. Thomas Science Center (JST) houses students interested in STEM (Science, Technology, Engineering, and Mathematics). The building consists classrooms, labs and offices for the biology, chemistry, mathematics, and computer science department" */
        marker.map = mapView
        marker.opacity = 0.0

        let markerTingley = GMSMarker()
        markerTingley.position = CLLocationCoordinate2D(latitude: 33.49844, longitude: -80.85436)
        markerTingley.icon = GMSMarker.markerImage(with: .blue)
        markerTingley.title = "Historical Tingley Memorial Hall"
        markerTingley.map = mapView
        markerTingley.opacity = 0.0
        
        let markerARM = GMSMarker()
        markerARM.position = CLLocationCoordinate2D(latitude: 33.49821, longitude: -80.85474)
        markerARM.icon = GMSMarker.markerImage(with: .blue)
        markerARM.title = "Arthur Rose Museum"
        markerARM.map = mapView
        markerARM.opacity = 0.0
        
        let markerWVM = GMSMarker()
        markerWVM.position = CLLocationCoordinate2D(latitude: 33.49782, longitude: -80.85476)
        markerWVM.icon = GMSMarker.markerImage(with: .blue)
        markerWVM.title = "W.V. Middleton Fine Arts Center"
        markerWVM.map = mapView
        markerWVM.opacity = 0.0
        
        let markerUMC = GMSMarker()
        markerUMC.position = CLLocationCoordinate2D(latitude: 33.49760, longitude: -80.85490)
        markerUMC.icon = GMSMarker.markerImage(with: .blue)
        markerUMC.title = "University Music Center"
        markerUMC.map = mapView
        markerUMC.opacity = 0.0
        
        let markerStudentCenter = GMSMarker()
        markerStudentCenter.position = CLLocationCoordinate2D(latitude: 33.49690, longitude: -80.85515)
        markerStudentCenter.title = "Student Center"
        markerStudentCenter.map = mapView
        markerStudentCenter.opacity = 0.0
        
        let markerKleist = GMSMarker()
        markerKleist.position = CLLocationCoordinate2D(latitude: 33.49655, longitude: -80.85480)
        markerKleist.title = "Kliest Hall (Female Residence)"
        markerKleist.map = mapView
        markerKleist.opacity = 0.0
        
        let markerHonorsCollege = GMSMarker()
        markerHonorsCollege.position = CLLocationCoordinate2D(latitude: 33.49674, longitude: -80.85434)
        markerHonorsCollege.title = "Alice Carson Tisdale Honors College"
        markerHonorsCollege.map = mapView
        markerHonorsCollege.opacity = 0.0
        
        let markerMinisterH = GMSMarker()
        markerMinisterH.position = CLLocationCoordinate2D(latitude: 33.49703, longitude: -80.85426)
        markerMinisterH.title = "Ministers' Hall"
        markerMinisterH.map = mapView
        markerMinisterH.opacity = 0.0
        
        let markerCorson = GMSMarker()
        markerCorson.position = CLLocationCoordinate2D(latitude: 33.49711, longitude: -80.85376)
        markerCorson.title = "Fred P. Corson Hall"
        markerCorson.map = mapView
        markerCorson.opacity = 0.0
        
        let markerTrustee = GMSMarker()
        markerTrustee.position = CLLocationCoordinate2D(latitude: 33.49741, longitude: -80.85453)
        markerTrustee.title = "Trustee Hall"
        markerTrustee.map = mapView
        markerTrustee.opacity = 0.0
        
        let markerGTK = GMSMarker()
        markerGTK.position = CLLocationCoordinate2D(latitude: 33.49761, longitude: -80.85407)
        markerGTK.title = "Grace T. Kennedy Business and Communications"
        markerGTK.map = mapView
        markerGTK.opacity = 0.0
    }
   
    func setupLocationManager() {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
    }
    func checkLocationServces(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //Show alert letting the user know they have to turn this on
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.isMyLocationEnabled = true
            break
        case .denied:
            //Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
}

extension CUNavigationFirstPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus ){
        
    }
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
