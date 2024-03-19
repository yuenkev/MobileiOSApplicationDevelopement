import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D?
    var userMarker: MKPointAnnotation?
    
    var location: CLLocationCoordinate2D?
    var destLocation: CLLocationCoordinate2D?
    var marker: MKPointAnnotation?
    var endMarker: MKPointAnnotation?
    
    // MARK: - IBOutlets
    
    @IBOutlet var mapView: MKMapView?
    @IBOutlet var desLatitude: UITextField?
    @IBOutlet var desLongitude: UITextField?
    @IBOutlet var goButton: UIButton?
    
    // MARK: - Button Action
    
    @IBAction func goToDestination() {
        guard let latitudeText = desLatitude?.text,
              let longitudeText = desLongitude?.text,
              let latitude = Double(latitudeText),
              let longitude = Double(longitudeText) else { return }
        
        let destination = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        showRouteOnMap(startLocation: userLocation!, endLocation: destination)
        
        userMarker = MKPointAnnotation()
        userMarker?.title = "Destination"
        userMarker?.coordinate = destination
        mapView?.addAnnotation(userMarker!)
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set map location to this coordinate
        location = CLLocationCoordinate2D(latitude: 43.4695852, longitude: -79.6992129)
        destLocation = CLLocationCoordinate2D(latitude: 43.6572877, longitude: -79.7420212)
        
        marker = MKPointAnnotation()
        marker?.title = "Sheridan Trafalgar"
        marker?.coordinate = location!
        
        endMarker = MKPointAnnotation()
        endMarker?.title = "Sheridan Brampton"
        endMarker?.coordinate = destLocation!
        
        mapView?.mapType = .standard
        mapView?.addAnnotation(marker!)
        mapView?.addAnnotation(endMarker!)
        mapView?.delegate = self
        
        showRouteOnMap(startLocation: location!, endLocation: destLocation!)
        
        // Zoom into region
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location!, span: mapSpan)
        mapView?.setRegion(region, animated: true)
        
        // Request location authorization
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 100
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingHeading()
        }
        locationManager.startMonitoringVisits()
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 5.0
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        marker?.title = "Tapped"
        endMarker?.title = "Tapped"
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView()
        annotationView.image = UIImage(named: "marker")
        
        let label = UILabel(frame: CGRect(x: (annotationView.frame.width / 2) - 25,
                                           y: annotationView.frame.maxY + 20,
                                           width: annotationView.frame.width * 2,
                                           height: annotationView.frame.height))
        annotationView.addSubview(label)
        annotationView.annotation = annotation
        return annotationView
    }
    
    // MARK: - Helper Functions
    
    func showRouteOnMap(startLocation: CLLocationCoordinate2D, endLocation: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startLocation, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endLocation, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let newResponse = response else { return }
            if let route = newResponse.routes.first {
                self.mapView?.addOverlay(route.polyline)
                self.mapView?.setVisibleMapRect(route.polyline.boundingMapRect,
                                                 edgePadding: UIEdgeInsets(top: 80.0, left: 20.0, bottom: 100.0, right: 20.0),
                                                 animated: true)
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location  = locations.last {
            userLocation = location.coordinate
            
            userMarker = MKPointAnnotation()
            userMarker?.title = "Your Location"
            userMarker?.coordinate = location.coordinate
            mapView?.addAnnotation(userMarker!)
            
            let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: userLocation!, span: mapSpan)
            mapView?.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("New heading: \(newHeading)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            print("Location manager authorization denied")
        case .notDetermined:
            print("Location manager authorization not determined")
        case .authorizedWhenInUse:
            print("Location manager authorized when in use")
        case .authorizedAlways:
            print("Location manager authorized always")
        case .restricted:
            print("Location manager authorization restricted")
        default:
            print("Location manager authorization status: \(manager.authorizationStatus)")
        }
    }
}
