//
//  File.swift
//  FCB The Board
//
//  Created by Rad almuallim on 2017-04-18.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class File: UIViewController {
    
    
    @IBOutlet weak var webView2: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://forcombo.com/SignUp.aspx")
        
        webView2.loadRequest(URLRequest (url: url!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

