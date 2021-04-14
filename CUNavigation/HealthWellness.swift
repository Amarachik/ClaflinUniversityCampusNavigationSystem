//
//  HealthWellness.swift
//  CUNavigation
//
//  Created by Amarachi Kalu-Onuma on 1/3/21.
//  Copyright © 2021 Amarachi Kalu-Onuma. All rights reserved.
//

import UIKit

struct HealthWellness{
    let title: String
    let image: UIImage
}


let categories: [HealthWellness] = [
    HealthWellness(title: "University Health Center", image: UIImage(systemName: "stethoscope")!),
    HealthWellness(title: "JTK Gymnasium Center", image: UIImage(systemName: "arrow.up.heart")!),
    HealthWellness(title: "Gymnasium @ Commons", image: UIImage(systemName: "waveform.path.ecg")!)
]

