//
//  File.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-15.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

var LSelection = [String]()

class SecondView: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var Label0: UILabel!
    @IBOutlet var Label1: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var Label3: UILabel!
    @IBOutlet var Label4: UILabel!
    @IBOutlet var Label5: UILabel!
    @IBOutlet var Label6: UILabel!
    @IBOutlet var Label7: UILabel!
    @IBOutlet var Label8: UILabel!
    @IBOutlet var Label9: UILabel!
    
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
    
    @IBOutlet var T: [UITextField]!
    
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
    
    @IBOutlet var dimensionLabel: UILabel!
    
    @IBOutlet var freight2: UITextField!
    @IBOutlet var margin2: UITextField!
    
    @IBOutlet var lineal2: UILabel!
    @IBOutlet var fbm2: UILabel!
    @IBOutlet var avgPrice2: UILabel!
    @IBOutlet var finalPrice2: UILabel!
    
    var fbm : Double = 0
    var finalPrice : Double = 0
    var avgPrice : Double = 0
    var lineal : Double = 0
    var sum1 : Double = 0
    var sum2 : Double = 0
    
    var L = [ 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var pArr = [String]()
    var lArr = [String]()
    var price = [Double]()
    var lift = [Int]()
    var freight : Int = 0
    var margin : Int = 0
    
    
    @IBOutlet var Calculate: UIButton!
    @IBAction func Calculate(_ sender: Any) {
        
        avgPrice = 0
        sum1 = 0
        sum2 = 0
        fbm = 0
        lineal = 0
        freight = 0
        margin = 0
        
        performSegue(withIdentifier: "Login", sender: nil)
        
        if SettingsController.dimensions[choice] != "   " {
            
            if freight2.text != "" {
                
                freight = Int(freight2.text!)!
                
            }
            
            if margin2.text != "" {
                
                margin = Int(margin2.text!)!
                
            }
            
            
            pArr = [PField1.text!, PField2.text!, PField3.text!, PField4.text!, PField5.text!, PField6.text!, PField7.text!, PField8.text!, PField9.text!, PField10.text!]
            lArr = [LField1.text!, LField2.text!, LField3.text!, LField4.text!, LField5.text!, LField6.text!, LField7.text!, LField8.text!, LField9.text!, LField10.text!]
           
            for i in 0...9 {
                
                if pArr [i] == "" {
                    
                    pArr[i] = "0"
                    
                }
                
                if lArr [i] == "" {
                    
                    lArr [i] = "0"
                    
                }
                
            }
            
            
            price = [ Double(pArr[0]), Double(pArr[1]), Double(pArr[2]), Double(pArr[3]), Double(pArr[4]), Double(pArr[5]), Double(pArr[6]), Double(pArr[7]), Double(pArr[8]), Double(pArr[9])] as! [Double]
            lift = [ Int(lArr[0]), Int(lArr[1]), Int(lArr[2]), Int(lArr[3]), Int(lArr[4]), Int(lArr[5]), Int(lArr[6]), Int(lArr[7]), Int(lArr[8]), Int(lArr[9])] as! [Int]
            
            print(price)
            print(lift)
            
            for i in 0...9 {
                
                fbm = fbm + ((L[i] * Double(lift[i]) * Double(WDict[DSelection]!) * Double(HDict[DSelection]!) * Double(LDict[DSelection]!)) / 12)
                
                sum1 = sum1 + Double(Double(L[i]) * price[i] * Double(lift[i]))
                sum2 = sum2 + Double(L[i] * Double(lift[i]))
                
                lineal = lineal + (L[i] * Double(lift[i]))
                
            }
            
            if sum2 == 0 {
                
                avgPrice = 0
                
            }else{
                
                avgPrice = sum1 / sum2
                print(avgPrice)
                avgPrice = Double(round(100*avgPrice)/100)
                
            }
            
            margin = (margin / 100) + 1
            
            finalPrice = (avgPrice + Double(freight)) * Double(margin)
            
    
            print(fbm)
            print(avgPrice)
            print(lineal)
            
            fbm2.text = String(fbm)
            avgPrice2.text = "$" + String(avgPrice)
            lineal2.text = String(lineal)
            finalPrice2.text = "$" + String(finalPrice)
            
            print(WDict[DSelection]!)
            print(HDict[DSelection]!)
            print(LDict[DSelection]!)
            
        }
        
        
        
    }
    
    //var T = [ self.PField1, self.PField2, self.PField3, self.PField4, self.PField5, self.PField6, self.PField7, self.PField8, self.PField9, self.PField10 ]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "lengths") != nil {
            
            lengths = UserDefaults.standard.object(forKey: "lengths") as! [String]
            
        }
        
        if UserDefaults.standard.object(forKey: "selection") != nil {
            
            DSelection = UserDefaults.standard.object(forKey: "selection") as! String
            
        } else {
            
            DSelection = "Please select the Dimensions"
            
        }
        
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
        
        if LSelection.count != 0 {
            
            Label0.text! = LSelection[0] + "'"
            Label1.text! = LSelection[1] + "'"
            Label2.text! = LSelection[2] + "'"
            Label3.text! = LSelection[3] + "'"
            Label4.text! = LSelection[4] + "'"
            Label5.text! = LSelection[5] + "'"
            Label6.text! = LSelection[6] + "'"
            Label7.text! = LSelection[7] + "'"
            Label8.text! = LSelection[8] + "'"
            Label9.text! = LSelection[9] + "'"
            
            for i in 0...9 {
                
                if LSelection[i] != "" {
                    
                    L[i] = Double(LSelection[i])!
                    
                }
                
            }
            
        }
        
        print(L)
        
        dimensionLabel.text = DSelection
        
        
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

