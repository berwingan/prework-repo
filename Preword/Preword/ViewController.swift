//
//  ViewController.swift
//  Preword
//
//  Created by Berwin Gan on 18/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateTIpSlide(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = Double(tipSlider.value)
        let tip = bill*tipPercentages
        let total = bill+tip
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //update the tip amount
        totalLabel.text = String(format: "$%.2f",total)
        
        

    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0

        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //update the tip amount
        totalLabel.text = String(format: "$%.2f",total)
        
    }
    

}

