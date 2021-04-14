//
//  SSSViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 2/15/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class SSSViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SSSWebsite(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.claflin.edu/student-life/services-support/trio-programs/trio-student-support-services")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet weak var SSSCollectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBAction func SSSDirections(_ sender: Any) {
        let latitutde:CLLocationDegrees = 33.49711
        let longitude:CLLocationDegrees = -80.85376
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Corson Hall - Student Support Services"
        mapItem.openInMaps(launchOptions: options)
    }
    
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var SSSCollection = SSSClass.fetchWriting()
    let cellScale: CGFloat = 0.6
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = SSSCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        SSSCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        SSSCollectionView.dataSource = self
    }
}
extension SSSViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SSSCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SSSCollectionViewCell", for: indexPath) as! SSSCollectionViewCell
        let SSSSlide = SSSCollection[indexPath.item]
        
        cell.SSSSlide = SSSSlide
        
        return cell
    }
}

