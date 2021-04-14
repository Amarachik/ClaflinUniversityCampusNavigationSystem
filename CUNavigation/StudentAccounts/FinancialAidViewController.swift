//
//  FinancialAidViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/28/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class FinancialAidViewController: UIViewController {

    @IBAction func CashierDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.49844
        let longitude:CLLocationDegrees = -80.85436
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Tingley Memorial Hall - Cashier's Office"
        mapItem.openInMaps(launchOptions: options)
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
}
