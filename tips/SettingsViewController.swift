//
//  SettingsViewController.swift
//  tips
//
//  Created by Marcos Oliveira on 2/2/15.
//  Copyright (c) 2015 Techbinding. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentIndex = defaults.integerForKey("tip_percent")
        
        defaultTipPercentage.selectedSegmentIndex = percentIndex
    }

    
    @IBAction func defaultTipPercentageChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaultTipPercentage.selectedSegmentIndex
        
        defaults.setInteger(index, forKey: "tip_percent")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
