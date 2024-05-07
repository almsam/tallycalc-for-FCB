//
//  File.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-15.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class SecondView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var PField1: UITextField!
    @IBOutlet var PField2: UITextField!
    @IBOutlet var PField3: UITextField!
    @IBOutlet var PField4: UITextField!
    @IBOutlet var PField5: UITextField!
    @IBOutlet var PField6: UITextField!
    @IBOutlet var PField7: UITextField!
    @IBOutlet var PField8: UITextField!
    @IBOutlet var PField9: UITextField!
    @IBOutlet var PField10: UITextField!
    
    @IBOutlet var LField1: UITextField!
    @IBOutlet var LField2: UITextField!
    @IBOutlet var LField3: UITextField!
    @IBOutlet var LField4: UITextField!
    @IBOutlet var LField5: UITextField!
    @IBOutlet var LField6: UITextField!
    @IBOutlet var LField7: UITextField!
    @IBOutlet var LField8: UITextField!
    @IBOutlet var LField9: UITextField!
    @IBOutlet var LField10: UITextField!
    
    var fbm : Int = 0
    var avgPrice : Float = 0
    var lineal : Int = 0
    var sum1 : Float = 0
    var sum2 : Float = 0
    
    var length = [ 5, 6, 7, 8, 10, 12, 14, 16, 18, 20]
    var pArr = [String]()
    var lArr = [String]()
    var price = [Int]()
    var lift = [Int]()
    
    @IBOutlet var Calculate: UIButton!
    
    @IBOutlet var dropDown: UIPickerView!
    
    var choice : Int = 0
    //var dimensions = [ "Dimensions (Lift Size)", "1x4", "1x6", "1x8", "2x4", "2x6", "2x8"]
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        let countRows : Int = SettingsController.dimensions.count
        return countRows
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let rowTitle = SettingsController.dimensions[row]
        return rowTitle
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        choice = row
        print(choice)
        //print("-" + SettingsController.dimensions[choice] + "-")
        //print(WDict[SettingsController.dimensions[choice]]!)
        //print(HDict[SettingsController.dimensions[choice]]!)
        //print(LDict[SettingsController.dimensions[choice]]!)
        
    }
    
    @IBAction func Calculate(_ sender: Any) {
        
        avgPrice = 0
        sum1 = 0
        sum2 = 0
        fbm = 0
        lineal = 0
        
        if SettingsController.dimensions[choice] != "   " {
            
            pArr = [ PField1.text!, PField2.text!, PField3.text!, PField4.text!, PField5.text!, PField6.text!, PField7.text!, PField8.text!, PField9.text!, PField10.text!]
            lArr = [LField1.text!, LField2.text!, LField3.text!, LField4.text!, LField5.text!, LField6.text!, LField7.text!, LField8.text!, LField9.text!, LField10.text!]
            
            for i in 0...9 {
                
                if pArr [i] == "" {
                    
                    pArr[i] = "0"
                    
                }
                
                if lArr [i] == "" {
                    
                    lArr [i] = "0"
                    
                }
                
            }
            
            
            price = [ Int(pArr[0]), Int(pArr[1]), Int(pArr[2]), Int(pArr[3]), Int(pArr[4]), Int(pArr[5]), Int(pArr[6]), Int(pArr[7]), Int(pArr[8]), Int(pArr[9])] as! [Int]
            lift = [ Int(lArr[0]), Int(lArr[1]), Int(lArr[2]), Int(lArr[3]), Int(lArr[4]), Int(lArr[5]), Int(lArr[6]), Int(lArr[7]), Int(lArr[8]), Int(lArr[9])] as! [Int]
            
            print(price)
            print(lift)
            
            for i in 0...9 {
                
                fbm = fbm + ((length[i] * lift[i] * WDict[SettingsController.dimensions[choice]]! * HDict[SettingsController.dimensions[choice]]! * LDict[SettingsController.dimensions[choice]]!) / 12)
                
                sum1 = sum1 + Float(length[i] * price[i] * lift[i])
                sum2 = sum2 + Float(length[i] * lift[i])
                
                lineal = lineal + (length[i] * lift[i])
                
            }
            
            if sum2 == 0 {
                
                avgPrice = 0
                
            }else{
                
                avgPrice = sum1 / sum2
                print(avgPrice)
                avgPrice = Float(round(100*avgPrice)/100)
                
            }
            
            
            print(fbm)
            print(avgPrice)
            print(lineal)
            
            print(WDict[SettingsController.dimensions[choice]]!)
            print(HDict[SettingsController.dimensions[choice]]!)
            print(LDict[SettingsController.dimensions[choice]]!)
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "dimensions") != nil {
            
            SettingsController.dimensions = UserDefaults.standard.object(forKey: "dimensions") as! [String]
            
        }
        
        if UserDefaults.standard.object(forKey: "Width") != nil {
            
            WDict = UserDefaults.standard.object(forKey: "Width") as! [String:Int]
            
        }
        
        
        if UserDefaults.standard.object(forKey: "Height") != nil {
            
            HDict = UserDefaults.standard.object(forKey: "Height") as! [String:Int]
            
        }
        
        if UserDefaults.standard.object(forKey: "Lift") != nil {
            
            LDict = UserDefaults.standard.object(forKey: "Lift") as! [String:Int]
            
        }
        
        WDict["2x4, LFT:294"] = 2
        HDict["2x4, LFT:294"] = 4
        LDict["2x4, LFT:294"] = 294
        
        WDict["2x6, LFT:189"] = 2
        HDict["2x6, LFT:189"] = 6
        LDict["2x6, LFT:189"] = 189
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

