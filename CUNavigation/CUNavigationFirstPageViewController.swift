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
import Alamofire
import SwiftyJSON
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
        
        let sourceLocation = "\(33.49897), \(-80.85424)"
        let destinationLocation = "\(33.50147), \(-80.85269)"
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(sourceLocation)&destination=\(destinationLocation)&mode=walking&key=AIzaSyDbwEVVfZr4w5VhAVl7Bx56O4AbcajVSBY"
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        AF.request(encodedURL).responseJSON { (response) in
            guard let data = response.data else {
                return
            }
            do {
                let jsonData = try JSON(data: data)
                print(jsonData)
                let routes = jsonData["routes"].arrayValue
                for route in routes {
                    let overview_polyline = route["overview_polyline"].dictionary
                    let points = overview_polyline?["points"]?.string
                    let path = GMSPath.init(fromEncodedPath: points ?? "")
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeColor = .systemGreen
                    polyline.strokeWidth = 5
                    polyline.map = self.mapView
                    }
                }
            catch let error {
                print(error.localizedDescription)
            }
        }

        //Labels all buildings on campus with a marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 33.49897, longitude: -80.85424)
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.title = "James S. Thomas Science Center (JST)"
   /*     marker.snippet = "James S. Thomas Science Center (JST) houses students interested in STEM (Science, Technology, Engineering, and Mathematics). The building consists classrooms, labs and offices for the biology, chemistry, mathematics, and computer science department" */
        marker.map = mapView
        //marker.opacity = 0.0

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
        
        let markerStudentCenter = GMSMarker()
        markerStudentCenter.position = CLLocationCoordinate2D(latitude: 33.49690, longitude: -80.85515)
        markerStudentCenter.title = "Student Center"
        markerStudentCenter.icon = GMSMarker.markerImage(with: .blue)
        markerStudentCenter.map = mapView
        
        let markerKleist = GMSMarker()
        markerKleist.position = CLLocationCoordinate2D(latitude: 33.49655, longitude: -80.85480)
        markerKleist.title = "Kliest Hall (Female Residence)"
        markerKleist.map = mapView
        markerKleist.opacity = 0.0
        
        let markerHonorsCollege = GMSMarker()
        markerHonorsCollege.position = CLLocationCoordinate2D(latitude: 33.49674, longitude: -80.85434)
        markerHonorsCollege.title = "Alice Carson Tisdale Honors College"
        markerHonorsCollege.icon = GMSMarker.markerImage(with: .blue)
        markerHonorsCollege.map = mapView
        
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
        
        let markerDunton = GMSMarker()
        markerDunton.position = CLLocationCoordinate2D(latitude: 33.497524, longitude: -80.853169)
        markerDunton.title = "Mary E. Dunton Hall"
        markerDunton.map = mapView
        markerDunton.opacity = 0.0
        
        let markerChapel = GMSMarker()
        markerChapel.position = CLLocationCoordinate2D(latitude: 33.49791, longitude: -80.85263)
        markerChapel.title = "James and Dorothy Z. Elmore Chapel"
        markerChapel.map = mapView
        markerChapel.opacity = 0.0
        
        let markerLaymen = GMSMarker()
        markerLaymen.position = CLLocationCoordinate2D(latitude: 33.49816, longitude: -80.85321)
        markerLaymen.title = "Laymen Hall"
        markerLaymen.map = mapView
        markerLaymen.opacity = 0.0
        
        let markerBowen = GMSMarker()
        markerBowen.position = CLLocationCoordinate2D(latitude: 33.49834, longitude: -80.85353)
        markerBowen.title = "Bowen Hall/ The Freshman College"
        markerBowen.map = mapView
        markerBowen.opacity = 0.0
        
        let markerAsbury = GMSMarker()
        markerAsbury.position = CLLocationCoordinate2D(latitude: 33.49853, longitude: -80.85309)
        markerAsbury.title = "Asbury Residence Hall"
        markerAsbury.map = mapView
        markerAsbury.opacity = 0.0
        
        let markerLibrary = GMSMarker()
        markerLibrary.position = CLLocationCoordinate2D(latitude: 33.49907, longitude: -80.85346)
        markerLibrary.title = "H V Manning Library"
        markerLibrary.map = mapView
        markerLibrary.opacity = 1.0
        if #available(iOS 13.0, *) {
            markerLibrary.icon = UIImage(systemName: "books.vertical")
        } else {
            // Fallback on earlier versions
        }
      
        let markerSouth = GMSMarker()
        markerSouth.position = CLLocationCoordinate2D(latitude: 33.49841, longitude: -80.85230)
        markerSouth.title = "SRC South"
        markerSouth.map = mapView
        markerSouth.opacity = 0.0
        
        let markerEast = GMSMarker()
        markerEast.position = CLLocationCoordinate2D(latitude: 33.49865, longitude: -80.85196)
        markerEast.title = "SRC East"
        markerEast.icon = GMSMarker.markerImage(with: .blue)
        markerEast.map = mapView
        
        let markerNorth = GMSMarker()
        markerNorth.position = CLLocationCoordinate2D(latitude: 33.49918, longitude: -80.85210)
        markerNorth.title = "SRC North"
        markerNorth.map = mapView
        markerNorth.opacity = 0.0
        
        let markerWest = GMSMarker()
        markerWest.position = CLLocationCoordinate2D(latitude: 33.49964, longitude: -80.85227)
        markerWest.title = "SRC West"
        markerWest.map = mapView
        markerWest.opacity = 0.0
        
        let markerCommons = GMSMarker()
        markerCommons.position = CLLocationCoordinate2D(latitude: 33.49959, longitude: -80.85276)
        markerCommons.title = "Claflin Commons"
        markerCommons.icon = GMSMarker.markerImage(with: .blue)
        markerCommons.map = mapView
        
        let markerHighRise = GMSMarker()
        markerHighRise.position = CLLocationCoordinate2D(latitude: 33.49985, longitude: -80.85332)
        markerHighRise.title = "High-Rise Residence Hall"
        markerHighRise.map = mapView
        markerHighRise.opacity = 0.0
        
        let markerDining = GMSMarker()
        markerDining.position = CLLocationCoordinate2D(latitude: 33.49858, longitude: -80.85240)
        markerDining.title = "University Dining Facility/ Panther Plaza"
        markerDining.map = mapView
        markerDining.opacity = 0.0
        
        let markerJTK = GMSMarker()
        markerJTK.position = CLLocationCoordinate2D(latitude: 33.50147, longitude: -80.85269)
        markerJTK.title = "Jonas T. Kennedy Health and Physical Education"
        markerJTK.icon = GMSMarker.markerImage(with: .blue)
        markerJTK.map = mapView
        
        let markerAnnex = GMSMarker()
        markerAnnex.position = CLLocationCoordinate2D(latitude: 33.50187, longitude: -80.85187)
        markerAnnex.title = "JST Annex"
        markerAnnex.map = mapView
        markerAnnex.opacity = 0.0
        
        let markerHealth = GMSMarker()
        markerHealth.position = CLLocationCoordinate2D(latitude: 33.50085, longitude: -80.85204)
        markerHealth.title = "Student Health Center"
        markerHealth.icon = GMSMarker.markerImage(with: .blue)
        markerHealth.map = mapView
        
        let markerMSRC = GMSMarker()
        markerMSRC.position = CLLocationCoordinate2D(latitude: 33.50150, longitude: -80.85069)
        markerMSRC.title = "Molecular Science Research Center"
        markerMSRC.icon = GMSMarker.markerImage(with: .blue)
        markerMSRC.map = mapView

        let markerHistory = GMSMarker()
        markerHistory.position = CLLocationCoordinate2D(latitude: 33.50066, longitude: -80.85212)
        markerHistory.title = "Department of History & Sociology"
        markerHistory.icon = GMSMarker.markerImage(with: .blue)
        markerHistory.map = mapView
        
        let markerTRIO = GMSMarker()
        markerTRIO.position = CLLocationCoordinate2D(latitude: 33.50173, longitude: -80.85071)
        markerTRIO.title = "Department of TRIO/ Upward Bound"
        markerTRIO.icon = GMSMarker.markerImage(with: .blue)
        markerTRIO.map = mapView
        markerTRIO.opacity = 0.0
        
        let markerCounseling = GMSMarker()
        markerCounseling.position = CLLocationCoordinate2D(latitude: 33.50182, longitude: -80.85059)
        markerCounseling.title = "Department of Counseling Center/ ADA"
        markerCounseling.icon = GMSMarker.markerImage(with: .blue)
        markerCounseling.map = mapView
               
        let markerSponsoredProgram = GMSMarker()
        markerSponsoredProgram.position = CLLocationCoordinate2D(latitude: 33.50184, longitude: -80.85103)
        markerSponsoredProgram.title = "Department of Sponsored Programs"
        markerSponsoredProgram.map = mapView
        markerSponsoredProgram.opacity = 0.0
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
