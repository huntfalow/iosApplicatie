//
//  LandmarkAnnotation.swift
//  iosFinal
//
//  Created by Vincent on 08/06/2021.
//  Copyright © 2021 Vincent. All rights reserved.
//

import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation{
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark){
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}


