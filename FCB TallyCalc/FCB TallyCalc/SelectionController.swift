//
//  File.swift
//  FCB TallyCalc
//
//  Created by Rad almuallim on 2018-07-19.
//  Copyright © 2018 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

var choice : Int = 0
var DSelection : String = ""
//var LSelection = [String]()

class SelectionController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var dropDown2: UIPickerView!
    @IBOutlet var dropDown: UIPickerView!
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if pickerView == dropDown {
            
            let countRows : Int = SettingsController.dimensions.count
            return countRows
            
        }else if pickerView == dropDown2{
            
            let countRows : Int = lengths.count
            return countRows
            
        }
        
        return 1
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == dropDown {
            
            let rowTitle = SettingsController.dimensions[row]
            return rowTitle
            
        }else if pickerView == dropDown2{
            
            let rowTitle = lengths[row]
            return rowTitle
            
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        choice = row
        
        if pickerView == dropDown {
            
            DSelection = SettingsController.dimensions[choice]
            UserDefaults.standard.set(DSelection, forKey: "selection")
            print(choice)
            
        }else if pickerView == dropDown2{
            
            LSelection = lengths[choice].components(separatedBy: ",")
            
            print(LSelection.count)
            
            let c = 10 - LSelection.count
            
            if c != 0 {
                
                for i in 1...c {
                    
                    LSelection.append("")
                    
                }
                
            }
            
            
            print(LSelection)
            
        }
        
        
    }
    
    
}
