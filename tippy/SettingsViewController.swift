//
//  SettingsViewController.swift
//  tippy
//
//  Created by Maria De la Rosa on 8/14/17.
//  Copyright © 2017 Maria De la Rosa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ValueChanged(_ sender: Any) {
        let currentTip = tipSlider.value
        tipLabel.text = String(format: "%.2f%%",currentTip)
        
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        defaults.set(currentTip, forKey: "tipDefault")
        defaults.synchronize()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        let storedValue = defaults.object(forKey: "tipDefault")
        if(storedValue != nil){
            let defaultTipValue = storedValue as! Float
            tipSlider.setValue(defaultTipValue, animated: false)
            tipLabel.text = String(format: "%.2f%%",defaultTipValue)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
