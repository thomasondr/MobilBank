//
//  ATMSearchViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit
import MapKit
import CoreLocation

class ATMSearchViewController: UIViewController, CLLocationManagerDelegate {

    let otpAtm  = MKPointAnnotation()
    let cibAtm = MKPointAnnotation()
    let kandhAtm = MKPointAnnotation()
    
    var annotations:[MKPointAnnotation] = []
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    let dummyNearestATMDistance:Float = 35.65
    let dummyUnit = "m"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        otpAtm.coordinate = CLLocationCoordinate2D(latitude: 47.3456, longitude: 19.456)
        mapView.addAnnotation(otpAtm)
        cibAtm.coordinate = CLLocationCoordinate2D(latitude: 47.3244, longitude: 19.446)
        mapView.addAnnotation(cibAtm)
        kandhAtm.coordinate = CLLocationCoordinate2D(latitude: 47.3198, longitude: 19.442)
        mapView.addAnnotation(kandhAtm)
        
        annotations.append(otpAtm)
        annotations.append(cibAtm)
        annotations.append(kandhAtm)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        updateNearestDistance()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    func updateNearestDistance() {
        
        distance.text = "344.4 m"
    }
    
    private func userDistance(from point: MKPointAnnotation) -> Double? {
        guard let userLocation = mapView.userLocation.location else {
            return nil // User location unknown!
        }
        let pointLocation = CLLocation(
            latitude:  point.coordinate.latitude,
            longitude: point.coordinate.longitude
        )
        return userLocation.distance(from: pointLocation)
    }
    
    private func calculateNearestAtm() -> Double {
        var nearest:Double!
        var locationsFromAtm:[Double] = []
        
        for annotation in self.annotations {
            let distance = userDistance(from: annotation)
            locationsFromAtm.append(distance!)
            nearest = locationsFromAtm.min()!
        }
        
        return nearest
    }

}
