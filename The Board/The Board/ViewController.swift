//
//  ViewController.swift
//  The Board
//
//  Created by Rad almuallim on 2017-08-05.
//  Copyright © 2017 Forest Commodities Board Inc. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet var wrongPassword: UILabel!
    
    public static var webContent = ""
    
    var pass = ""
    
    var wasSuccessful = false
        
    func closeKeyboard() {
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        closeKeyboard()
        
        wrongPassword.text = ""
        
        print(username.text!)
        print(password.text!)
        
        loading.isHidden = true
        loading.stopAnimating()
        
        
        if password.text! == "1234abcd" {
            
            pass = "ef73781effc5774100f87fe2f437a435"
            
        } else {
            
            pass = ""
            
        }
        
        let attemtedUrl = URL(string: "http://66.70.179.204/PHPforMobile/ValidateUser4.php?email=" + username.text! + "&password=" + pass)

        if let url = attemtedUrl {
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                
                if let urlContent = data {
                    
                    ViewController.webContent = NSString(data:urlContent, encoding: String.Encoding.utf8.rawValue)! as String
                    
                    if ((ViewController.webContent != "Please Provide correct Username and Password") && (ViewController.webContent != "Invalid User")) {
                        
                        self.wasSuccessful = true
                        self.loading.isHidden = false
                        self.loading.startAnimating()
                        
                        DispatchQueue.main.async(execute: {
                            
                            ViewController.webContent = ViewController.webContent.replacingOccurrences(of: ":", with: ",")
                            print(ViewController.webContent)
                            self.performSegue(withIdentifier: "segueOne", sender: nil)
                            
                        })
                        
                        self.loading.isHidden = true
                        self.loading.stopAnimating()
                        
                    }
                 
                }
                
                if error != nil {
                    
                    self.wasSuccessful = true
                    
                    DispatchQueue.main.async(execute: { 
                        
                        self.wrongPassword.text = "Could not connect to server!"
                        print("Could not connect to server!")
                        
                    })
                    
                }
                
                if self.wasSuccessful == false {
                    
                    DispatchQueue.main.async(execute: {
                        
                        self.loading.isHidden = false
                        self.loading.startAnimating()
                        self.wrongPassword.text = "Incorrect Username or Password."
                        print("Incorrect Username or Password")
                        self.loading.isHidden = true
                        self.loading.stopAnimating()
                    })
                    
                    
                }
                

            })
            task.resume()
        }
        
        self.loading.isHidden = true
        self.loading.stopAnimating()
        
        self.wasSuccessful = false
        
        
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        closeKeyboard()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        username.delegate = self
        password.delegate = self
        password.text = nil
        username.text = nil
        loading.isHidden = true
        loading.stopAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

