//
//  ViewController.swift
//  mapKitProject
//
//  Created by Linara Ualiyeva on 3/22/21.
//

import UIKit
import MapKit
class ViewController: UIViewController {
   
    var delegate: NewDelegate?

    var mapTypes: [Int: MKMapType] = [0: .standard, 1: .hybrid, 2: .satellite]
    @IBOutlet weak var myMap: MKMapView!
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        myMap.mapType = mapTypes[sender.selectedSegmentIndex] ?? .standard
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        print("The annotation was selected: \(String(describing: view.annotation?.title ?? "No title enteres")) \(String(describing: view.annotation?.subtitle ?? "No subtitle enteres"))")
    }
    
    @IBAction func longTap(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: self.myMap)
        let coordinatePoint = self.myMap.convert(touchPoint, toCoordinateFrom: self.myMap)
        
        let alertController = UIAlertController(title: "New Location", message: "Fill the fields", preferredStyle: .alert)
        alertController.addTextField{ (textfield) in textfield.placeholder = "Location"
        }
        alertController.addTextField{ (textfield) in textfield.placeholder = "Description"
        }
        
        
        let save = UIAlertAction(title: "Save", style: .default) {
            [weak self](alert) in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            let annotation = MKPointAnnotation()
            
            annotation.title = firstTextField.text
            annotation.subtitle = secondTextField.text
            annotation.coordinate = coordinatePoint
            
            self?.delegate?.addSomeCell(title: firstTextField.text!, subtitle: secondTextField.text!)

        
            
            self?.myMap.addAnnotation(annotation)
         }
        
        let cancel  = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        
           
        
        alertController.addAction(cancel)
        
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
   // @IBAction func selectedSegment(_ sender: Any) {
       
  //  }
    
    //@IBOutlet weak var segmentSelected: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myMap.delegate = self
    }

}


extension ViewController: MKMapViewDelegate {
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
    let identifier = "PlaceMark"
    
   var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
    
    if annotationView == nil{
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationView?.canShowCallout = true
        annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
    }else{
        annotationView?.annotation = annotation
    }
    return annotationView
}
    private func myMap(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        print("The annotation was selected: \(String(describing: view.annotation?.title ?? "No title enteres")) \(String(describing: view.annotation?.subtitle ?? "No subtitle enteres"))")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "second", sender: view)
    }
    
}
