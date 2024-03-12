//
//  ViewController.swift
//  MapView
//
//  Created by Apptist Inc. on 2023-03-13.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //MARK: - IBOutlet
    
    @IBOutlet var mapView: MKMapView?
    
    //MARK: - Properties
    
    //A point on our map
    var annotation: MKPointAnnotation?
    
    //Specify in lat and long where we are located on the map
    var location: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the coordinates for the location
        location = CLLocationCoordinate2D(latitude: CLLocationDegrees.init(exactly: 43.494860)!, longitude: CLLocationDegrees.init(exactly: -79.652560)!)
        
        //This will be set to the coordinates of the location
        annotation = MKPointAnnotation()
        annotation?.title = "My Location"
        annotation?.coordinate = location!
        
        //Set the map view
        mapView?.mapType = .standard
        mapView?.addAnnotation(annotation!)
        mapView?.delegate = self
        
        //Position the map on the location
        var mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        var region = MKCoordinateRegion(center: location!, span: mapSpan)
        mapView?.setRegion(region, animated: true)
       
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        annotation?.title = "Tapped"
        print("I've tapped the annotation")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = MKAnnotationView()
        
        annotationView.image = UIImage(named: "marker")
        
        var label = UILabel(frame: CGRect(origin: CGPoint(x: (annotationView.frame.width / 2) - 25, y: annotationView.frame.maxY + 20), size: CGSize(width: annotationView.frame.width * 2 , height: annotationView.frame.height)))
        
        label.text = "Mark's Location"
        label.numberOfLines = 2
        annotationView.addSubview(label)
        annotationView.annotation = annotation
        
        
        return annotationView
    }

}
