//
//  SecondViewController.swift
//  MultipageApp
//
//  Created by Kevin Yuen on 2024-01-29.
//

import UIKit

class SecondViewController: UIViewController {
    
    var passedString = "" //This will be passed from the first VC
    
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = passedString //update the text in the textView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
