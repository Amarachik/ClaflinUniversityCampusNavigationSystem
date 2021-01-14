//
//  HealthandWellnessViewController.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 11/22/20.
//  Copyright © 2020 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

class HealthandWellnessViewController: UIViewController {
    
    @IBOutlet weak var HWCollectionView: UICollectionView!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var headerView: UIView!
    
    func addBottomBorders() {
       let thickness: CGFloat = 3.0
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x:0, y: self.headerView.frame.size.height - thickness, width: self.headerView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor(red:5/255, green:31/255, blue:49/255, alpha: 1).cgColor
       headerView.layer.addSublayer(bottomBorder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomBorders()
        
        HWCollectionView.dataSource = self
        HWCollectionView.delegate = self
        HWCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension HealthandWellnessViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HWCollectionView.dequeueReusableCell(withReuseIdentifier: "H_WCollectionViewCell", for: indexPath) as! H_WCollectionViewCell
        cell.setup(with: categories[indexPath.row])
        return cell
    }
}

extension HealthandWellnessViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 175)
    }
}
