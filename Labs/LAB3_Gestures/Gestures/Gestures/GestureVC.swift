//
//  GestureVC.swift
//  Gestures
//
//  Created by Mark-Anthony Octavius Meritt on 2023-03-23.
//

import UIKit

class GestureVC: UIViewController {
    
    //MARK: - Gesture with no IBActions
    
    var tapGesture: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()

        ///Programatic gesture
        ///We can select the tap function to be connected to this gesture
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        
        ///Add this gesture to the view
        ///Number of taps required is 1
        self.view.addGestureRecognizer(tapGesture!)
        tapGesture?.numberOfTapsRequired = 1
    }
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("Hey I was tapped")
    }
    

   //MARK: - IBActions
    /*
    ///Tapped
    @IBAction func tapped(_ gestureRecognizer: UITapGestureRecognizer) {
        print("Hey I was tapped")
        ///Double tap
        gestureRecognizer.numberOfTapsRequired = 2
    }
    
    
    ///Swiped
    @IBAction func swiped(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        gestureRecognizer.direction = .left
        
        print("Swiped down")
    }
    
    ///Pinched
    @IBAction func pinched(_ gesutreRecognizer: UIPinchGestureRecognizer) {
        print("I was pinched")
    }

    
    ///Long press
    @IBAction func longPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        gestureRecognizer.minimumPressDuration = 2.0
        print("I was long pressed")
    }
    
    //Panned
    @IBAction func panned(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        print(" I was panned")
    }
    
    @IBAction func rotated(_ gestureRecognizer: UIRotationGestureRecognizer) {
        
        print("I was rotated!")
    }
     */
}


