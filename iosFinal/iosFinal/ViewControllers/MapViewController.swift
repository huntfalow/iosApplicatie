//
//  MapViewController.swift
//  iosFinal
//
//  Created by Vincent on 08/06/2021.
//  Copyright © 2021 Vincent. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01,
                                    longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        mapView.setRegion(region,
                          animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

