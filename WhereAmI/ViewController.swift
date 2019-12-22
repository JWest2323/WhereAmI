//
//  ViewController.swift
//  WhereAmI
//
//  Created by Jamal West on 12/13/19.
//  Copyright © 2019 Jamal West. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class ViewController: UIViewController {
  


    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let coord = CLLocationCoordinate2D(latitude: 31.0, longitude: -91.0)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.5, longitudeDelta: 0.5    )
        let region = MKCoordinateRegion.init(center: coord, span: span)
        let animated = true
        
        mapView.setRegion(region, animated: animated)
    }

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state == .ended else { return }
        let point = sender.location(ofTouch: 0, in: mapView)
        let coord = mapView.convert(point, toCoordinateFrom: mapView)
        
        let ann = MKPointAnnotation.init()
        ann.coordinate = coord
        ann.title = "Here"
        ann.subtitle = "subtitle"
        self.mapView.addAnnotation(ann)
        
        let loc = CLLocation.init(latitude: coord.latitude, longitude: coord.longitude)
        CLGeocoder().reverseGeocodeLocation(loc) { (placemarks, error) in
            for pm in placemarks! {
                let ann = MKPointAnnotation.init()
                ann.coordinate = coord
                ann.title = placemarks!.first!.thoroughfare
                ann.subtitle = placemarks!.first!.postalAddress?.city
                self.mapView.addAnnotation(ann)
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            }

        }
    }
    
}

