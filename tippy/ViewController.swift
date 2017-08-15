//
//  ViewController.swift
//  tippy
//
//  Created by Maria De la Rosa on 7/29/17.
//  Copyright © 2017 Maria De la Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tiplabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    //my slider
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var Percentlabel: UILabel!
    @IBAction func ValueChange(_ sender: Any) {
        
        
        let currentTip = tipSlider.value
        Percentlabel.text = String(format: "%.2f%%",currentTip)
        calculateTip(sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        let storedValue = defaults.object(forKey: "tipDefault")
        if(storedValue != nil){
            let defaultTipValue = storedValue as! Float
            tipSlider.setValue(defaultTipValue, animated: false)
            Percentlabel.text = String(format: "%.2f%%",defaultTipValue)
        }
    }
    
    //end slider
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
          let tipPercentage = Double(tipSlider.value)/100
        //let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        //let tip = bill * tipPercentages[TipControl.selectedSegmentIndex]
        let tip = bill * tipPercentage
        let total = tip + bill
        
        tiplabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
        
    }
}

