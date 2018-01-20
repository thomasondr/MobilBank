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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateNearestDistance()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.05,0.05)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    func updateNearestDistance() {
        let distanceValue:String = dummyNearestATMDistance.description + " " + dummyUnit
        distance.text = distanceValue
    }
    
    

}
