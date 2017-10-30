//
//  ViewController.swift
//  MySettings
//
//  Created by cis290 on 10/30/17.
//  Copyright © 2017 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textFieldKeyConstant = "textFieldKeyName"
    let switchKeyConstant = "switchKeyName"
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    func clear()
    {
        txtEmail.resignFirstResponder()
        txtFullName.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        if let textFieldValue = defaults.string(forKey: textFieldKeyConstant)
        {
            myTextField.text = textFieldValue
        }
        if(defaults.bool(forKey: switchKeyConstant))
        {
            mySwitch.isOn = true
        }else
        {
            mySwitch.isOn = false
        }
        if defaults.string(forKey: "fullname") != nil{
            txtFullName.text = defaults.string(forKey: "fullname")
        }
        if defaults.string(forKey: "email") != nil{
            txtEmail.text = defaults.string(forKey: "email")
        }
        if defaults.string(forKey: "bdate") != nil{
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            datepicker.setDate(date!, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myButton(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.setValue(myTextField.text, forKey: textFieldKeyConstant)
        defaults.set(mySwitch.isOn, forKey: switchKeyConstant)
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtEmail.text, forKey: "email")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
        
        
    }
}

