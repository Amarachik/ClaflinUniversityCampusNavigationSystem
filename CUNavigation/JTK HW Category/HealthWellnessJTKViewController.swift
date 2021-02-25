//
//  HealthWellnessJTKViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/25/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class HealthWellnessJTKViewController: UIViewController {

   
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func HWWebsiteButton(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.claflin.edu/student-life/claflin-university-athletics-department/health-and-wellness-center")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet var headerView: UIView!
    @IBOutlet var HealthWellnessCollectionView: UICollectionView!
    @IBAction func JTKDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.50147
        let longitude:CLLocationDegrees = -80.85269
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Student Health Center"
        mapItem.openInMaps(launchOptions: options)
    }
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var healthWell = HealthWellnessClass.fetchWriting()
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = HealthWellnessCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        HealthWellnessCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        HealthWellnessCollectionView.dataSource = self
    }
}

extension HealthWellnessJTKViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthWell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HealthWellnessJTKCollectionViewCell", for: indexPath) as! HealthWellnessJTKCollectionViewCell
        let HealthWellnessSlide = healthWell[indexPath.item]
        
        cell.HealthWellnessSlide = HealthWellnessSlide
        
        return cell
    }
}

