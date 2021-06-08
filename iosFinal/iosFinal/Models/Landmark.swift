//
//  Landmark.swift
//  iosFinal
//
//  Created by Vincent on 08/06/2021.
//  Copyright © 2021 Vincent. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D{
        self.placemark.coordinate
    }
}
