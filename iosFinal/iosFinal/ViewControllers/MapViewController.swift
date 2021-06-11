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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    let manager = CLLocationManager()
    private var landmarks: [Landmark] = [Landmark]()
    
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
        mapView.delegate = self
        mapView.setRegion(region,
                          animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Current location"
        
        mapView.addAnnotation(pin)
        self.getNearByLandmarks()
        updateAnnotations(from: mapView)
    }


    
    func mapView(_ mapViewIcon: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapViewIcon.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "User")
        
        return annotationView
    }
    

    

    
    private func getNearByLandmarks(){
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = "cocktail"
        request.region = mapView.region
            
            let search = MKLocalSearch(request: request)
            search.start{(response, error) in
                if let response = response {
                    let mapItems = response.mapItems
                    self.landmarks = mapItems.map{
                        Landmark(placemark: $0.placemark)
                    }
                }
                    
                
            }
        }
    
    private func updateAnnotations(from mapView: MKMapView){
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
 

}

