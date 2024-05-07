//
//  ViewController.swift
//  FCB The Board
//
//  Created by Rad almuallim on 2017-04-13.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://forcombo.com/login-buyer.aspx")
        
        webView.loadRequest(URLRequest (url: url!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

