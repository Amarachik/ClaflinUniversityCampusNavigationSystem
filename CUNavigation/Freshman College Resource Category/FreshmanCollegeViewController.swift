//
//  FreshmanCollegeViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class FreshmanCollegeViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func FCWebsiteButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.claflin.edu/academics-research/special-programs-and-opportunities/freshman-college")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var freshmanCollegeCollectionView: UICollectionView!
    @IBAction func FCDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.49834
        let longitude:CLLocationDegrees = -80.85353
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Bowen Hall - Freshman College"
        mapItem.openInMaps(launchOptions: options)
    }
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var freshmanCollege = FreshmanCollegeClass.fetchWriting()
    
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = freshmanCollegeCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        freshmanCollegeCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        freshmanCollegeCollectionView.dataSource = self
    }
}


extension FreshmanCollegeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return freshmanCollege.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FreshmanCollegeCollectionViewCell", for: indexPath) as! FreshmanCollegeCollectionViewCell
        let freshmanCollegeSlide = freshmanCollege[indexPath.item]
        
        cell.freshmanCollegeSlide = freshmanCollegeSlide
        
        return cell
    }
}


