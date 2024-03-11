//
//  FifthViewController.swift
//  MultipageApp
//
//  Created by Kevin Yuen on 2024-02-25.
//

import UIKit
import WebKit

class FifthViewController: UIViewController {

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Sheridan College website
        if let url = URL(string: "https://www.sheridancollege.ca/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
