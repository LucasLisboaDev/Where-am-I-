//
//  ViewController.swift
//  Where am I?
//
//  Created by Lucas Lisboa  on 2/5/24.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var textAddress: UITextField!
    @IBAction func findOut(_ sender: UIButton) { let geocoder = CLGeocoder()
        if let address = textAddress.text {
            geocoder.geocodeAddressString(address) { [weak self] (placemarks, error) in
                if let placemark = placemarks?.first, let location = placemark.location {
                    self?.updateUIWithCoordinates(location.coordinate)
                } else {
                    // Handle error or no location found
                }
            }
        }
    }
    
    let locationManager = CLLocationManager()
    
    func updateUIWithCoordinates(_ coordinate: CLLocationCoordinate2D) {
        latitude.text = "Latitude: \(coordinate.latitude)"
        longitude.text = "Longitude: \(coordinate.longitude)"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is a test for git nad github")
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
    }


}

