//
//  ViewController.swift
//  tips
//
//  Created by Marcos Oliveira on 1/14/15.
//  Copyright (c) 2015 Techbinding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.0 0"
        totalLabel.text = "$0.00"
       
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: "onSettingsButton")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentSetting = defaults.integerForKey("tip_percent")
        
        tipControl.selectedSegmentIndex = percentSetting
        self.onEditingChange(self)
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func onSettingsButton(sender: AnyObject) {
        let settingsViewController = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

}