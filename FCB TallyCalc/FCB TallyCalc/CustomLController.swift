//
//  CustomLController.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-24.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

var lengths = ["5,6,7,8,10,12,14,16,18,20"]

class CustomLController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var L1: UITextField!
    @IBOutlet var L2: UITextField!
    @IBOutlet var L3: UITextField!
    @IBOutlet var L4: UITextField!
    @IBOutlet var L5: UITextField!
    @IBOutlet var L6: UITextField!
    @IBOutlet var L7: UITextField!
    @IBOutlet var L8: UITextField!
    @IBOutlet var L9: UITextField!
    @IBOutlet var L10: UITextField!
    
    @IBOutlet var Add: UIButton!
    
    @IBAction func Add(_ sender: Any) {
        
        if L1.text != "" || L2.text != "" || L3.text != "" || L4.text != "" || L5.text != "" || L6.text != "" || L7.text != "" || L8.text != "" || L9.text != "" || L10.text != "" {
            
            var s = "!" + L1.text! + "," + L2.text! + "," + L3.text! + "," + L4.text! + "," + L5.text! + "," + L6.text! + "," + L7.text! + "," + L8.text! + "," + L9.text! + "," + L10.text! + "!"
            
            s = s.replacingOccurrences(of: ",,,,,,,,,", with: ",").replacingOccurrences(of: ",,,,,,,,", with: ",").replacingOccurrences(of: ",,,,,,,", with: ",").replacingOccurrences(of: ",,,,,,", with: ",").replacingOccurrences(of: ",,,,,", with: ",").replacingOccurrences(of: ",,,,", with: ",").replacingOccurrences(of: ",,,", with: ",").replacingOccurrences(of: ",,", with: ",").replacingOccurrences(of: ",!", with: "").replacingOccurrences(of: "!,", with: "").replacingOccurrences(of: "!", with: "")
            
            lengths.append(s)
            
            UserDefaults.standard.set(lengths, forKey: "lengths")
            print(lengths)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
