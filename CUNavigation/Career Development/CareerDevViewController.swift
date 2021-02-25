//
//  CareerDevViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/28/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class CareerDevViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CareerDevWebsite(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.claflin.edu/student-life/career-development")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var CareerDevCollectionView: UICollectionView!
    @IBAction func CareerDevDirectios(_ sender: Any) {
        let latitutde:CLLocationDegrees = 33.49711
        let longitude:CLLocationDegrees = -80.85376
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Corson Hall - Career Development Center"
        mapItem.openInMaps(launchOptions: options)
    }
    
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var CareerDevCollection = CareerDevClass.fetchWriting()
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = CareerDevCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        CareerDevCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        CareerDevCollectionView.dataSource = self
    }
}
extension CareerDevViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CareerDevCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareerDevCollectionViewCell", for: indexPath) as! CareerDevCollectionViewCell
        let CareerDevSlide = CareerDevCollection[indexPath.item]
        
        cell.CareerDevSlide = CareerDevSlide
        
        return cell
    }
}
