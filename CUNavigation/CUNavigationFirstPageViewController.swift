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
import MapKit
import SwiftyJSON
import CoreLocation

class CUNavigationFirstPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //outlets
  
    @IBOutlet weak var BuildingsSearchTextField: UITextField!
    @IBOutlet weak var ExploreLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var AcadDevBtn: UIButton!
    @IBOutlet weak var StudActBtn: UIButton!
    @IBOutlet weak var HealthWellBtn: UIButton!
    @IBOutlet weak var ResourcesBtn: UIButton!
    
    var buildingObjectHolder: buildingPicker?
    
    @IBAction func PickerNavBtn(_ sender: Any) {
        if let buildingObject = buildingObjectHolder {
            openInMaps(latitutde: buildingObject.buildingLatitude, longitude: buildingObject.buildingLongitude, name: buildingObject.building)
        }
    }
    
    let locationManger = CLLocationManager()
    class buildingPicker {
        let building : String
        let buildingLongitude : Double
        let buildingLatitude : Double
        
        init(building: String, buildingLongitude : Double, buildingLatitude: Double) {
            self.building = building
            self.buildingLongitude = buildingLongitude
            self.buildingLatitude = buildingLatitude
        }
    }
    var buildings:[buildingPicker] = [
        buildingPicker(building: "James S. Thomas Science Center", buildingLongitude: -80.85424, buildingLatitude: 33.49897),
        buildingPicker(building: "Historical Tingley Memorial Hall", buildingLongitude: -80.85436, buildingLatitude: 33.49844),
        buildingPicker(building: "Arthur Rose Museum", buildingLongitude: -80.85474, buildingLatitude: 33.49821),
        buildingPicker(building: "W.V. Middleton Fine Arts Center", buildingLongitude: -80.85476, buildingLatitude: 33.49782),
        buildingPicker(building: "University Music Center", buildingLongitude: -80.85490, buildingLatitude: 33.49760),
        buildingPicker(building: "Student Center", buildingLongitude: -80.85515, buildingLatitude: 33.49690),
        buildingPicker(building: "Kliest Hall (Female Residence)", buildingLongitude: -80.85480, buildingLatitude: 33.49655),
        buildingPicker(building: "Alice Carson Tisdale Honors College", buildingLongitude: 33.49674, buildingLatitude: -80.85434),
        buildingPicker(building: "Ministers' Hall", buildingLongitude: -80.85426, buildingLatitude: 33.49703),
        buildingPicker(building: "Fred P. Corson Hall", buildingLongitude: -80.85376, buildingLatitude: 33.49711),
        buildingPicker(building: "Trustee Hall", buildingLongitude: -80.85453, buildingLatitude: 33.49741),
        buildingPicker(building: "Grace T. Kennedy Business and Communications", buildingLongitude: -80.85407, buildingLatitude: 33.49761),
        buildingPicker(building: "Mary E. Dunton Hall", buildingLongitude: -80.853169, buildingLatitude: 33.497524),
        buildingPicker(building: "James and Dorothy Z. Elmore Chapel", buildingLongitude: -80.85263, buildingLatitude: 33.49791),
        buildingPicker(building: "Laymen Hall", buildingLongitude: -80.85321, buildingLatitude: 33.49816),
        buildingPicker(building: "Bowen Hall/ The Freshman College", buildingLongitude: -80.85353, buildingLatitude: 33.49834),
        buildingPicker(building: "Asbury Residence Hall", buildingLongitude: -80.85309, buildingLatitude: 33.49853),
        buildingPicker(building: "H V Manning Library", buildingLongitude: -80.85346, buildingLatitude: 33.49907),
        buildingPicker(building: "SRC South", buildingLongitude: -80.85230, buildingLatitude: 33.49841),
        buildingPicker(building: "SRC East", buildingLongitude: -80.85196, buildingLatitude: 33.49865),
        buildingPicker(building: "SRC North", buildingLongitude: -80.85210, buildingLatitude: 33.49918),
        buildingPicker(building: "SRC West", buildingLongitude: 33.49964, buildingLatitude: -80.85227),
        buildingPicker(building: "Claflin Commons", buildingLongitude: -80.85276, buildingLatitude: 33.49959),
        buildingPicker(building: "High-Rise Residence Hall", buildingLongitude: -80.85332, buildingLatitude: 33.49985),
        buildingPicker(building: "University Dining Facility/ Panther Plaza", buildingLongitude: -80.85240, buildingLatitude: 33.49858),
        buildingPicker(building: "Jonas T. Kennedy Health and Physical Education", buildingLongitude: -80.85269, buildingLatitude: 33.50147),
        buildingPicker(building: "JST Annex", buildingLongitude: -80.85187, buildingLatitude: 33.50187),
        buildingPicker(building: "Student Health Center", buildingLongitude: -80.85204, buildingLatitude: 33.50085),
        buildingPicker(building: "Molecular Science Research Center", buildingLongitude: -80.85069, buildingLatitude: 33.50150),
        buildingPicker(building: "Department of History & Sociology", buildingLongitude: -80.85212, buildingLatitude: 33.50066),
        buildingPicker(building: "Department of TRIO/ Upward Bound", buildingLongitude: -80.85071, buildingLatitude: 33.50173),
        buildingPicker(building: "Department of Counseling Center/ ADA", buildingLongitude: -80.85059, buildingLatitude: 33.50182),
        buildingPicker(building: "Department of Sponsored Programs", buildingLongitude: -80.85103, buildingLatitude: 33.50184),
    ]

    var pickerView = UIPickerView()
   // var filteredData = [String]()
    
    @objc func donePressed(){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        AcadDevBtn.layer.cornerRadius = 7.0
        AcadDevBtn.layer.borderWidth = 2
        AcadDevBtn.layer.borderColor = UIColor(red:0/255, green:64/255, blue:103/255, alpha: 1).cgColor
        AcadDevBtn.layer.masksToBounds = true
        
        ResourcesBtn.layer.cornerRadius = 7.0
        ResourcesBtn.layer.borderWidth = 2
        ResourcesBtn.layer.borderColor = UIColor(red:27/255, green:108/255, blue:162/255, alpha: 1).cgColor
        ResourcesBtn.layer.masksToBounds = true
        
        HealthWellBtn.layer.cornerRadius = 7.0
        HealthWellBtn.layer.borderWidth = 2
        HealthWellBtn.layer.borderColor = UIColor(red:27/255, green:106/255, blue:161/255, alpha: 1).cgColor
        HealthWellBtn.layer.masksToBounds = true
        
        StudActBtn.layer.cornerRadius = 7.0
        StudActBtn.layer.borderWidth = 2
        StudActBtn.layer.borderColor = UIColor(red:117/255, green:171/255, blue:220/255, alpha: 1).cgColor
        StudActBtn.layer.masksToBounds = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // BuildingsSearchTextField.delegate = self
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        BuildingsSearchTextField.inputAccessoryView = toolbar

        let row = UserDefaults.standard.integer(forKey: "pickerViewRow")
        pickerView.selectRow(row, inComponent: 0, animated: false)
        print (row)
      
        BuildingsSearchTextField.inputView = pickerView
       // BuildingsSearchTextField.textAlignment = .center
        BuildingsSearchTextField.placeholder = "Select a Building"
        BuildingsSearchTextField.leftViewMode = .always
        
        
        checkLocationServces()
        let camera = GMSCameraPosition.camera(withLatitude: 33.49838, longitude: -80.85353, zoom: 100)
        mapView.camera = camera
        mapView.mapType = .hybrid
        mapView.settings.compassButton = true
        mapView.animate(toZoom: 18)
        
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
        marker.setIconSize(scaledToSize: .init(width: 20, height: 30))
        marker.title = "James S. Thomas Science Center (JST)"
        marker.map = mapView

        let markerTingley = GMSMarker()
        markerTingley.position = CLLocationCoordinate2D(latitude: 33.49844, longitude: -80.85436)
        markerTingley.icon = GMSMarker.markerImage(with: .blue)
        markerTingley.title = "Historical Tingley Memorial Hall"
        markerTingley.map = mapView
        markerTingley.opacity = 0.0
        
        let markerARM = GMSMarker()
        markerARM.position = CLLocationCoordinate2D(latitude: 33.49821, longitude: -80.85474)
        markerARM.icon = GMSMarker.markerImage(with: .blue)
        markerARM.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerARM.title = "Arthur Rose Museum"
        markerARM.map = mapView
        //markerARM.opacity = 0.0
        
        let markerWVM = GMSMarker()
        markerWVM.position = CLLocationCoordinate2D(latitude: 33.49782, longitude: -80.85476)
        markerWVM.icon = GMSMarker.markerImage(with: .blue)
        markerWVM.title = "W.V. Middleton Fine Arts Center"
        markerWVM.map = mapView
        markerWVM.opacity = 0.0
        
        let markerUMC = GMSMarker()
        markerUMC.position = CLLocationCoordinate2D(latitude: 33.49760, longitude: -80.85490)
        markerUMC.icon = GMSMarker.markerImage(with: .purple)
        markerUMC.title = "University Music Center"
        markerUMC.map = mapView
        markerUMC.opacity = 0.0
        
        let markerStudentCenter = GMSMarker()
        markerStudentCenter.position = CLLocationCoordinate2D(latitude: 33.49690, longitude: -80.85515)
        markerStudentCenter.title = "Student Center"
        markerStudentCenter.icon = GMSMarker.markerImage(with: .blue)
        markerStudentCenter.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerStudentCenter.map = mapView
        
        let markerKleist = GMSMarker()
        markerKleist.position = CLLocationCoordinate2D(latitude: 33.49655, longitude: -80.85480)
        markerKleist.title = "Kliest Hall (Female Residence)"
        markerKleist.icon = GMSMarker.markerImage(with: .blue)
        markerKleist.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerKleist.map = mapView
        //markerKleist.opacity = 0.0
        
        let markerHonorsCollege = GMSMarker()
        markerHonorsCollege.position = CLLocationCoordinate2D(latitude: 33.49674, longitude: -80.85434)
        markerHonorsCollege.title = "Alice Carson Tisdale Honors College"
        markerHonorsCollege.icon = GMSMarker.markerImage(with: .blue)
        markerHonorsCollege.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerHonorsCollege.map = mapView
        
        let markerMinisterH = GMSMarker()
        markerMinisterH.position = CLLocationCoordinate2D(latitude: 33.49703, longitude: -80.85426)
        markerMinisterH.title = "Ministers' Hall"
        markerMinisterH.map = mapView
        markerMinisterH.opacity = 0.0
        
        let markerCorson = GMSMarker()
        markerCorson.position = CLLocationCoordinate2D(latitude: 33.49711, longitude: -80.85376)
        markerCorson.title = "Fred P. Corson Hall"
        markerCorson.icon = GMSMarker.markerImage(with: .blue)
        markerCorson.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerCorson.map = mapView
        
        let markerTrustee = GMSMarker()
        markerTrustee.position = CLLocationCoordinate2D(latitude: 33.49741, longitude: -80.85453)
        markerTrustee.title = "Trustee Hall"
        markerTrustee.map = mapView
        markerTrustee.opacity = 0.0
        
        let markerGTK = GMSMarker()
        markerGTK.position = CLLocationCoordinate2D(latitude: 33.49761, longitude: -80.85407)
        markerGTK.icon = GMSMarker.markerImage(with: .blue)
        markerGTK.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerGTK.title = "Grace T. Kennedy Business and Communications"
        markerGTK.map = mapView
        
        let markerDunton = GMSMarker()
        markerDunton.position = CLLocationCoordinate2D(latitude: 33.497524, longitude: -80.853169)
        markerDunton.icon = GMSMarker.markerImage(with: .blue)
        markerDunton.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerDunton.title = "Mary E. Dunton Hall"
        markerDunton.map = mapView
        
        
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
        markerBowen.icon = GMSMarker.markerImage(with: .blue)
        markerBowen.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerBowen.title = "Bowen Hall/ The Freshman College"
        markerBowen.map = mapView
        
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
        markerSouth.icon = GMSMarker.markerImage(with: .blue)
        markerSouth.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerSouth.map = mapView
        markerSouth.opacity = 0.0
        
        let markerEast = GMSMarker()
        markerEast.position = CLLocationCoordinate2D(latitude: 33.49865, longitude: -80.85196)
        markerEast.title = "SRC East"
        markerEast.icon = GMSMarker.markerImage(with: .blue)
        markerEast.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerEast.map = mapView
        
        let markerNorth = GMSMarker()
        markerNorth.position = CLLocationCoordinate2D(latitude: 33.49918, longitude: -80.85210)
        markerNorth.title = "SRC North"
        markerNorth.icon = GMSMarker.markerImage(with: .blue)
        markerNorth.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerNorth.map = mapView
        markerNorth.opacity = 0.0
        
        let markerWest = GMSMarker()
        markerWest.position = CLLocationCoordinate2D(latitude: 33.49964, longitude: -80.85227)
        markerWest.title = "SRC West"
        markerWest.icon = GMSMarker.markerImage(with: .blue)
        markerWest.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerWest.map = mapView
        markerWest.opacity = 0.0
        
        let markerCommons = GMSMarker()
        markerCommons.position = CLLocationCoordinate2D(latitude: 33.49959, longitude: -80.85276)
        markerCommons.title = "Claflin Commons"
        markerCommons.icon = GMSMarker.markerImage(with: .blue)
        markerCommons.map = mapView
        markerCommons.opacity = 0.0
        
        let markerHighRise = GMSMarker()
        markerHighRise.position = CLLocationCoordinate2D(latitude: 33.49985, longitude: -80.85332)
        markerHighRise.icon = GMSMarker.markerImage(with: .blue)
        markerHighRise.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerHighRise.title = "High-Rise Residence Hall"
        markerHighRise.map = mapView
        
        let markerDining = GMSMarker()
        markerDining.position = CLLocationCoordinate2D(latitude: 33.49858, longitude: -80.85240)
        markerDining.title = "University Dining Facility/ Panther Plaza"
        markerDining.icon = GMSMarker.markerImage(with: .blue)
        markerDining.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerDining.map = mapView
        
        let markerJTK = GMSMarker()
        markerJTK.position = CLLocationCoordinate2D(latitude: 33.50147, longitude: -80.85269)
        markerJTK.title = "Jonas T. Kennedy Health and Physical Education"
        markerJTK.icon = GMSMarker.markerImage(with: .blue)
        markerJTK.setIconSize(scaledToSize: .init(width: 20, height: 30))
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
        markerHealth.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerHealth.map = mapView
        
        let markerMSRC = GMSMarker()
        markerMSRC.position = CLLocationCoordinate2D(latitude: 33.50150, longitude: -80.85069)
        markerMSRC.title = "Molecular Science Research Center"
        markerMSRC.icon = GMSMarker.markerImage(with: .blue)
        markerMSRC.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerMSRC.map = mapView

        let markerHistory = GMSMarker()
        markerHistory.position = CLLocationCoordinate2D(latitude: 33.50066, longitude: -80.85212)
        markerHistory.title = "Department of History & Sociology"
        markerHistory.icon = GMSMarker.markerImage(with: .blue)
        markerHistory.setIconSize(scaledToSize: .init(width: 20, height: 30))
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
        markerCounseling.setIconSize(scaledToSize: .init(width: 20, height: 30))
        markerCounseling.map = mapView
               
        let markerSponsoredProgram = GMSMarker()
        markerSponsoredProgram.position = CLLocationCoordinate2D(latitude: 33.50184, longitude: -80.85103)
        markerSponsoredProgram.title = "Department of Sponsored Programs"
        markerSponsoredProgram.map = mapView
        markerSponsoredProgram.opacity = 0.0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       /* if filteredData.isEmpty {
            return filteredData.count
        } */
        return buildings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buildings[row].building
    }
    //Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let buildingObject = buildings[row]
        BuildingsSearchTextField.text = buildingObject.building
        self.view.endEditing(true)
        //Save selected row integer in User Defaults
        
        UserDefaults.standard.set(row, forKey: "pickerViewRow")
        //BuildingsSearchTextField.resignFirstResponder()
        //OPEN THE MAPS FROM HERE WITH THE BUILDING OBJECT'S CORDINATES
        buildingObjectHolder = buildingObject
    }
    
    /*  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            filterText(text+string)
        }
        
        return true
    }
    
     func filterText(_ query: String) {
        filteredData.removeAll()
        for string in buildings {
            if string.building.starts(with: query) {
                filteredData.append(string.building)
            }
        }
        self.pickerView.reloadAllComponents()
    } */
    
    func openInMaps(latitutde:CLLocationDegrees, longitude:CLLocationDegrees, name: String){
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
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
extension GMSMarker {
    func setIconSize(scaledToSize newSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        icon?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        icon = newImage
    }
}
