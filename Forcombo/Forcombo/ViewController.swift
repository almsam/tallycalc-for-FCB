//
//  ViewController.swift
//  Forcombo
//
//  Created by Rad almuallim on 2017-03-11.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://www.forcombo.com/login-buyer.aspx")
        
        webView.loadRequest(URLRequest(url: url!))

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

