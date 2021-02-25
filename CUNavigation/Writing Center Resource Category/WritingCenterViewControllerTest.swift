//
//  WritingCenterViewControllerTest.swift
//  CUNavigation
//
//  Created by Amarachi C. Kalu-Onuma on 11/13/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import MapKit
import UIKit

class WritingCenterViewControllerTest : UIViewController{
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func LearnMoreButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.claflin.edu/student-life/services-support/online-writing-center")! as URL, options:[:], completionHandler: nil)
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func WritingCenterDirections(_ sender: Any) {
        //Defining destination
        let latitutde:CLLocationDegrees = 33.49761
        let longitude:CLLocationDegrees = -80.85407
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitutde, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "GTK - Writing Center"
        mapItem.openInMaps(launchOptions: options)
    }
    func addBottomBorders() {
       let thickness: CGFloat = 2.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    
    var writingCenterQ = WritingCenterClass.fetchWriting()
    //var freshmanCollege = FreshmanCollegeClass.fetchWriting()
    
    let cellScale: CGFloat = 0.6
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()

    /*    WCButtonBorder.layer.cornerRadius = 5.0
        WCButtonBorder.clipsToBounds = true
        WCButtonBorder.layer.borderColor = UIColor.systemBlue.cgColor
        WCButtonBorder.layer.borderWidth = 2.0
 */
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView.dataSource = self
        //collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension WritingCenterViewControllerTest: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return writingCenterQ.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WritingCenterCollectionViewCell", for: indexPath) as! WritingCenterCollectionViewCell
        let writingCenter = writingCenterQ[indexPath.item]
        
        cell.writingCenter = writingCenter
        
        return cell
    }
}
