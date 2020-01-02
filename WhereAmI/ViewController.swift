//
//  ViewController.swift
//  WhereAmI
//fdsaflhdsafhds
//  Created by Jamal West on 12/13/19.
//  Copyright © 2019 Jamal West. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapKit: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

// function to calculate the city and country
//func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
//    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
//        completion(placemarks?.first?.locality,
//                   placemarks?.first?.country,
//                   error)
//    }
//}
//// function to generate annotations for random coordinates
//func generateAnnoLoc() {
//    
//    var num = 0
//    //First, declare While to repeat adding Annotation
//    while num != 15 {
//        num += 1
//        
//        //Add Annotation
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = generateRandomCoordinates(min: 70, max: 150) //this will be the maximum and minimum distance of the annotation from the current Location (Meters)
//        annotation.title = "Annotation Title"
//        annotation.subtitle = "SubTitle"
//        //this.mapKit.addAnnotation(annotation)
//        
//    }
//    
//}
//
//// function to generate random coordinates
//func generateRandomCoordinates(min: UInt32, max: UInt32)-> CLLocationCoordinate2D {
//    //Get the Current Location's longitude and latitude
//
//    let currentLong = currentLoc.coordinate.longitude
//    let currentLat = currentLoc.coordinate.latitude
//    
//    //1 KiloMeter = 0.00900900900901° So, 1 Meter = 0.00900900900901 / 1000
//    let meterCord = 0.00900900900901 / 1000
//    
//    //Generate random Meters between the maximum and minimum Meters
//    let randomMeters = UInt(arc4random_uniform(max) + min)
//    
//    //then Generating Random numbers for different Methods
//    let randomPM = arc4random_uniform(6)
//    
//    //Then we convert the distance in meters to coordinates by Multiplying the number of meters with 1 Meter Coordinate
//    let metersCordN = meterCord * Double(randomMeters)
//    
//    //here we generate the last Coordinates
//    if randomPM == 0 {
//        return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong + metersCordN)
//    }else if randomPM == 1 {
//        return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong - metersCordN)
//    }else if randomPM == 2 {
//        return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong - metersCordN)
//    }else if randomPM == 3 {
//        return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong + metersCordN)
//    }else if randomPM == 4 {
//        return CLLocationCoordinate2D(latitude: currentLat, longitude: currentLong - metersCordN)
//    }else {
//        return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong)
//    }
//    
//}
//
//// location manager tracker
//func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    guard let location: CLLocation = manager.location else { return }
//    fetchCityAndCountry(from: location) { city, country, error in
//        guard let city = city, let country = country, error == nil else { return }
//        print(city + ", " + country)
//    }
//}
// function to ask user for their current location
//func dropYourLocationMyGuy() {
//    let locationManager = CLLocationManager()
//    locationManager.requestAlwaysAuthorization()
//    locationManager.requestWhenInUseAuthorization()
//
//    if CLLocationManager.locationServicesEnabled() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
//
//}

