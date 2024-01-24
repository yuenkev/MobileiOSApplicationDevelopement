//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Yuen on 2024-01-22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    /*
     0-9 - 0-9
     10 - C
     11 - +
     13 - -
     14 - /
     15 - *
     */
    
    //Kevin: Properties
    var numberOnScreen : Double = 0.0
    var previousNumber : Double = 0.0
    var performingMath : Bool = false //If we already passed the operation
    var operation = 0 // operator selected
    
    var btnSound : AVAudioPlayer! // sound
    
    //Kevin: IBOutlets
    @IBOutlet var outputLbl : UILabel! //Output screen
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Kevin: IBAction
    @IBAction func numberBTN(_ sender:UIButton){
        
        //Action for number buttons pressed
        
        if performingMath == true {
            //if operation has been pressed already
            outputLbl.text = "" // clear input
            
            outputLbl.text = String(sender.tag) //output lable will be tag of value of button that we just pressed // e.g. 2 or 3 output will be 2 or 3
            
            numberOnScreen = Double(outputLbl.text!)! // setting the current number on screen to what is the output lbl
            
            performingMath = false // once number is pressed, we can select another operation
                
        } else {
            //if performingMath = false, operator has NOT been selected
            //Add the 2nd number... etc we pressed on the screen
            //Accumulating numbers on screen because operator is pressed
            outputLbl.text = outputLbl.text! + String(sender.tag)
        }
    }
    
    @IBAction func operators(_ sender:UIButton){
        //action for operator buttons prsesed
        if (outputLbl.text != "" && sender.tag != 11 && sender.tag != 10) {
            //if output label is NOT empty
            //if we did not press = or c
            previousNumber = Double(outputLbl.text!)! // set prev number to what is current on the screen
            
            if sender.tag == 12 {
                //add
                outputLbl.text = "+"
            } else if sender.tag == 13{
                // sub
                outputLbl.text = "-"
            } else if sender.tag == 14{
                // div
                outputLbl.text = "/"
            } else if sender.tag == 15{
                // mul
                outputLbl.text = "*"
            }
            
            operation = sender.tag // we will know which operator has been pressed
            
            performingMath = true // bc we pressed an operator
        } else if sender.tag == 11 {
            // if we press the equals button
            
            if operation == 12 {
                //add
                outputLbl.text = String(previousNumber + numberOnScreen)
            } else if operation == 13 {
                //sub
                outputLbl.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                //div
                outputLbl.text = String(previousNumber / numberOnScreen)
            } else if operation == 15 {
                //mul
                outputLbl.text = String(previousNumber * numberOnScreen)
            }
        } else if sender.tag == 10 {
            //pressed clear
            outputLbl.text = ""
            previousNumber = 0
            numberOnScreen = 0
        }
    }
    

}

