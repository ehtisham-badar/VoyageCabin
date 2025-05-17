//
//  SelectLocationViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 11/05/2025.
//

import UIKit
import GoogleMaps

class SelectLocationViewController: UIViewController {
    
    @IBOutlet weak var lblAddress: UITextField!
    @IBOutlet weak var mapView: UIView!
    
    var locationManager = CLLocationManager()
    var gmsMapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickDirectionIcon(_ sender: Any) {
        
    }
    @IBAction func onClickCurrentLocButton(_ sender: Any) {
        
    }
    @IBAction func onClickNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: RentTimeViewController.self)) as? RentTimeViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SelectLocationViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: 20.0)
        
        gmsMapView = GMSMapView.map(withFrame: mapView.bounds, camera: camera)
        gmsMapView?.isMyLocationEnabled = true
        mapView.addSubview(gmsMapView!)
        
        // Add marker
        let marker = GMSMarker()
        marker.position = location.coordinate
        marker.title = "You are here"
        marker.map = gmsMapView
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error)")
    }
}
