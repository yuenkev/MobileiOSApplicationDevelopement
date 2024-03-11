//
//  ViewControllerTwo.swift
//  MultipageApp
//
//  Created by Apptist Inc. on 2023-02-02.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    var stringText: String = " "
    
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.text = stringText
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    @IBAction func nextBtnPressed(){
        
    }
    

}
