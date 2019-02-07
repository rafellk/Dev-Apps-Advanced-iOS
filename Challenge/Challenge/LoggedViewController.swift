//
//  LoggedViewController.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/22/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LoggedViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var on😁Closed: ((Bool) -> Void)?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // requesting user permission
        locationManager.requestWhenInUseAuthorization()
        
        // creating a center zoom where the map will update
        if let coordinates = locationManager.location?.coordinate {
            update(coordinates: coordinates)
        }
        
        // adding a annotation
        let point = MKPointAnnotation()
        point.title = "This is my target"
        point.coordinate = CLLocationCoordinate2D(latitude: -8.0179, longitude: -34.8889)
        mapView.addAnnotation(point)
        
        // start location updates
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    private func update(coordinates: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        on😁Closed?(true)
    }
}

extension LoggedViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // update the location here
        if let coordinate = locations.last {
            let region = MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // update the authorization here
    }
}

extension LoggedViewController: MKMapViewDelegate {}


// requesting user permission
//        locationManager.requestWhenInUseAuthorization()

// creating a center zoom where the map will update
//        if let coordinate =  locationManager.location?.coordinate {
//            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
//            mapView.setRegion(region, animated: true)
//        }

// adding a annotation
//                let london = MKMarkerAnnotationView()
//                london.title = "This is my target"
//                london.coordinate = CLLocationCoordinate2D(latitude: -8.0179, longitude: -34.8889)
//                mapView.addAnnotation(london)


// start location updates
//        locationManager.startUpdatingLocation()
