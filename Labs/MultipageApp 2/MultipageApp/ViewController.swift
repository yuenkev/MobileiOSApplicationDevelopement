//
//  ViewController.swift
//  MultipageApp
//
//  Created by Apptist Inc. on 2023-01-30.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    //MARK: - Data source for picker
    
    var provinces = ["Ontario", "Alberta"]
    var genders = ["Male", "Female"]
    var countries = ["Canada", "USA"]
    
    var selectedProvince = " "
    var selectedGender = " "
    var selectedCountry = " "

    //MARK: - IBOutlets
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var addressTextField: UITextField!
    
    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var provincePicker: UIPickerView!
    
    @IBOutlet var postalCodeField: UITextField!
    
    @IBOutlet var countryPicker: UIPickerView!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var phoneTextField: UITextField!
    
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var militaryServiceSwitch: UISwitch!
    
    @IBOutlet var genderPicker: UIPickerView!
    
    @IBOutlet var occupationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        genderPicker.isUserInteractionEnabled = true
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        
        countryPicker.isUserInteractionEnabled = true
        
        provincePicker.dataSource = self
        provincePicker.delegate = self
        
        provincePicker.isUserInteractionEnabled = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

            return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == genderPicker {
            
             selectedGender = genders[row] as String

        }
        
        if pickerView == provincePicker {
            
             selectedProvince = provinces[row] as String

        }
        
        if pickerView == countryPicker {
            
             selectedCountry = countries[row] as String

        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker {
            return 2
        }
        
        if pickerView == provincePicker {
            return 2
        }
        
        if pickerView == countryPicker {
            return 2
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker {
            if row == 0 {
                return genders[0]
            }
            if row == 1 {
                return genders[1]
            }
        }
        
        if pickerView == countryPicker {
            if row == 0 {
                return countries[0]
            }
            if row == 1 {
                return countries[1]
            }
        }
        
        if pickerView == provincePicker {
            if row == 0 {
                return provinces[0]
            }
            if row == 1 {
                return provinces[1]
            }
        }
            return "None"
        
    }
    

    
    
    //MARK: - IBActions
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        print(firstNameTextField.text)
        print(lastNameTextField.text)
        print(addressTextField.text)
        print(cityTextField.text)
        print(provincePicker.selectedRow(inComponent: 0))
        print(postalCodeField.text)
        print(countryPicker.selectedRow(inComponent: 0))
        print(emailTextField.text)
        print(phoneTextField.text)
        print(ageLabel.text)
        print(militaryServiceSwitch.isOn)
        print(genderPicker.selectedRow(inComponent: 0))
        print(occupationTextField.text)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        ageLabel.text = "\(Int(sender.value))"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToVCTwo",
           let vcTwo = segue.destination as? ViewControllerTwo {
            vcTwo.stringText = "Your first name is \(firstNameTextField.text!) and your last name is \(lastNameTextField.text!).\n\nYour age is \(ageLabel.text!). \n\nYou live at \(addressTextField.text!) and your city is \(cityTextField.text!) and your province is \(selectedProvince) in \(selectedCountry).\n\n Your email address is \(emailTextField.text!) and your phone number is \(phoneTextField.text!).\n\n Which is postal code \(postalCodeField.text!).\n\n You \(militaryServiceSwitch.isOn ? "served in the Military" : "Haven't served in the Military").\n\n Your gender is \(selectedGender).\n\n You work as \(occupationTextField.text!)"
        }
    }
}

