//
//  CashierViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/28/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import Charts
import MapKit
import UIKit

class CashierViewController: UIViewController, ChartViewDelegate {

    @IBAction func BusinessOffDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.49711
        let longitude:CLLocationDegrees = -80.85376
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Corson Hall - Financial Aid"
        mapItem.openInMaps(launchOptions: options)
    }
    
    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        pieChart.delegate = self
    }

    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 1..<7 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.liberty()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }

}
