 //
//  PostedLoads.swift
//  The Board
//
//  Created by Rad almuallim on 2017-10-07.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit

class AvailableTrips: UITableViewController {
   
    public static var str2: Array = [""]
    public static var T = Array (repeatElement("", count: 100))
    public static var B = Array (repeatElement("", count: 100))
    public static var C = Array (repeatElement("", count: 100))
    var wasSuccessful = false
    public static var postedLoadsList = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postedLoadsUrl = URL(string: "http://66.70.179.204/PHPforMobile/UnassignedTrips.php?companyid=" + SecondView.str[7] + "&companyname=" + SecondView.str[9].replacingOccurrences(of: " ", with: ""))
        
        if let url = postedLoadsUrl {
            
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let urlContent = data {
                    
                    AvailableTrips.postedLoadsList = NSString(data:urlContent, encoding: String.Encoding.utf8.rawValue)! as String
                    
                    DispatchQueue.main.async(execute: {
                        
                        Trips()
                        self.wasSuccessful = true
                        print(AvailableTrips.str2)
                        
                        for i in 0...AvailableTrips.str2.count{
                            
                            print(AvailableTrips.T[i])
                            print(AvailableTrips.B[i])
                            print(AvailableTrips.C[i])

                        }
                        
                    })
                }
                
            })
            task.resume()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

func Trips() {
    
    AvailableTrips.str2 = AvailableTrips.postedLoadsList.replacingOccurrences(of: ":", with: ",").replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[{", with: "").replacingOccurrences(of: "}]", with: "").components(separatedBy: "},{")
    
    for i in 0...AvailableTrips.str2.count{
        
        var P: Array = AvailableTrips.str2[i].components(separatedBy: ",")
        AvailableTrips.T[i] = P[1]
        AvailableTrips.B[i] = P[3]
        AvailableTrips.C[i] = P[5]
        
    }
    
}




