//
//  ViewController.swift
//  MultipageApp
//
//  Created by Apptist Inc. on 2024-01-26.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var addressField: UITextField!
    
    @IBOutlet var genderField: UITextField!
    
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var dateOfBirth: UIDatePicker!
    
    var currentAge: Int = 0
    
    var currentGender: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        ///Check when the slider value is changed, we change the age label
        ///
        currentAge = Int(sender.value) //set current age to value
        
        ageLabel.text = "\(currentAge)"
    }
    
    @IBAction func submitBtnPressed() {
        
        ///Make an alert show with the information entered
        ///
        let buttonAlert = UIAlertController(title: "Thank you!", message: "\(nameField.text!) you've successfully completed the form! You are a \(genderField.text!) and you are \(currentAge) years old. You were born on \(dateOfBirth.date)", preferredStyle: .alert)
        
        //Add an OK button to alert to close it
        buttonAlert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(buttonAlert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the segue id is goToNextVC
        if segue.identifier == "goToNextVC"{
            
            //SEGUE Destination is SecondViewController
            if let nextVC = segue.destination as? SecondViewController{
                nextVC.passedString = "Thank you! \(nameField.text!) you've successfully completed the form! You are a \(genderField.text!) and you are \(currentAge) years old. You were born on \(dateOfBirth.date)"
            }
        }
    }
    
}

