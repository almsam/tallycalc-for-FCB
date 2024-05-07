//
//  ViewController.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-11.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //static public var isLoggedIn = false
    
    @IBOutlet var go: UIButton!
    
    @IBAction func go(_ sender: Any) {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

