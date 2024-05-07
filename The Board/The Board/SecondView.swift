//
//  File.swift
//  The Board
//
//  Created by Rad almuallim on 2017-08-19.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit
import Foundation

class SecondView : UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    public static var str = ViewController.webContent.replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")
    
    //var firstName = str[1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(SecondView.str[3] + SecondView.str[5])
        nameLabel.text = "Welcome " + SecondView.str[3] + " " + SecondView.str[5]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
