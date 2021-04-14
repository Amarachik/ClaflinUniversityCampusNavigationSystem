//
//  BookStoreViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 12/29/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class BookStoreViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func BKSWebsiteButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://claflin.bncollege.com/shop/claflin/home")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var BookStoreCollectionView: UICollectionView!
    @IBAction func BookStoreDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.49816
        let longitude:CLLocationDegrees = -80.85321
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Laymen Hall - BookStore"
        mapItem.openInMaps(launchOptions: options)
    }
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var bookStore = BookStoreClass.fetchWriting()
    
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = BookStoreCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        BookStoreCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        BookStoreCollectionView.dataSource = self
    }
}


extension BookStoreViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookStore.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreCollectionViewCell", for: indexPath) as! BookStoreCollectionViewCell
        let BookStoreSlide = bookStore[indexPath.item]
        
        cell.BookStoreSlide = BookStoreSlide
        
        return cell
    }
}
