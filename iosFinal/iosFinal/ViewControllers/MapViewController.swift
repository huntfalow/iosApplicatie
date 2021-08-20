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
    var isForCurrent = false
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
           // self.getNearByLandmarks()
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
        self.isForCurrent = true
        mapView.addAnnotation(pin)
     
       // updateAnnotations(from: mapView)
    }
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        print("clciked")
//    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("click")
    }

    
    func showMap(lat: String, lng: String) {
        let browserDomen: String = "https://www.google.co.in/maps/dir/"
        let directionBody: String = "?saddr=&daddr=\(lat),\(lng)&directionsmode=driving"
        let url = URL(string: "comgooglemaps://")
        if(UIApplication.shared.canOpenURL(url!)){
            let locationUrl = URL(string: "comgooglemaps://?center=\(lat),\(lng)&zoom=14&views=traffic")
            UIApplication.shared.open(locationUrl!)
        }
        else{
            let browserUrl = URL(string: browserDomen)!
            if(UIApplication.shared.canOpenURL(browserUrl)) {
                guard let browserFullPathUrl = URL(string: browserDomen + directionBody) else { return }
                UIApplication.shared.open(browserFullPathUrl)
            }
            // self.showErrorAlert(title: "", message: "Google Maps Not Installed")
        }
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.showMap(lat: "\(view.annotation!.coordinate.latitude)", lng: "\(view.annotation!.coordinate.longitude)")
//        let capital = view.annotation as! Capital
//        let placeName = capital.title
//        let placeInfo = capital.info
//
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
    }

    func mapView(_ mapViewIcon: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapViewIcon.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
           
        }else{
        
            annotationView!.annotation = annotation
        }
        if(self.isForCurrent){
            self.isForCurrent = false
            annotationView?.image = UIImage(named: "User")
        }
        else{
            let btn = UIButton(type: .detailDisclosure)
            annotationView!.rightCalloutAccessoryView = btn
            annotationView?.image = UIImage(named: "shop")
        }
     
        return annotationView
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        self.getNearByLandmarks()
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
                    self.updateAnnotations(from: self.mapView)
                }
            }
        }
    
    private func updateAnnotations(from mapView: MKMapView){
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
       
    }
 

}


