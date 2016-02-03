//
//  ViewController.swift
//  mySampleProject
//
//  Created by Vishnu Varthan P. on 27/01/16.
//  Copyright © 2016 com.e2infosystems. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        print ("hola")
        print("this is written only for branch 2")
        
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        locationManager.requestWhenInUseAuthorization();
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        else{
            print("Location service disabled");
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let locValue : CLLocationCoordinate2D = manager.location!.coordinate;
        let long = locValue.longitude;
        let lat = locValue.latitude;
        
        let coordinate1:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:11.9547, longitude:79.5277) //bes
        let coordinate2:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:lat , longitude:long) // tir
        
        print("coo \(coordinate2)")
        let point1:MKMapPoint = MKMapPointForCoordinate(coordinate1);
        let point2:MKMapPoint = MKMapPointForCoordinate(coordinate2);
        let distance:CLLocationDistance = MKMetersBetweenMapPoints(point1, point2)
        let kilometer:CLLocationDistance = distance / 1000;
        print("distance \(String(format:"%.1f", kilometer))")
        locationManager.stopUpdatingLocation();
        
        //Do What ever you want with it
    }

}

