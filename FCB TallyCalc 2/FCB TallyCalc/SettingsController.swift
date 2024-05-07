//
//  File.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-16.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

var WDict: [String : Int] = [:]
var HDict: [String : Int] = [:]
var LDict: [String : Int] = [:]


class SettingsController: UIViewController {

    public static var dimensions = ["   ", "2x4, LFT:294", "2x6, LFT:189"]
    
    @IBOutlet var liftField: UITextField!
    @IBOutlet var heightField: UITextField!
    @IBOutlet var widthField: UITextField!
    
    @IBOutlet var add: UIButton!
    @IBAction func add(_ sender: Any) {
        
        if widthField.text != "" && heightField.text != "" && liftField.text != "" {
            
            let s = widthField.text! + "x" + heightField.text! + ", LFT:" + liftField.text!
            
            SettingsController.dimensions.append(s)
            
            WDict[s] = Int(widthField.text!)
            HDict[s] = Int(heightField.text!)
            LDict[s] = Int(liftField.text!)
            
            widthField.text = ""
            heightField.text = ""
            liftField.text = ""
            
            UserDefaults.standard.set(SettingsController.dimensions, forKey: "dimensions")
            UserDefaults.standard.set(WDict, forKey: "Width")
            UserDefaults.standard.set(HDict, forKey: "Height")
            UserDefaults.standard.set(LDict, forKey: "Lift")
            

        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
