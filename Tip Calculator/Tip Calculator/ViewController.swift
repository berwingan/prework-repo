//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Berwin Gan on 19/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var perPersonAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var stepperButton: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.keyboardType = UIKeyboardType.numberPad
        billAmount.becomeFirstResponder()
        let defaults = UserDefaults.standard
        let oldbill = Double(defaults.integer(forKey: "Bill"))//return either integer or 0
        
        billAmount.text = String(format:"%.f",oldbill)
        let bill = oldbill
        let tipPercentages = Double(tipSlider.value)
        let tip = oldbill*tipPercentages
        let total = bill+tip
        tipAmount.text=String(format:"$%.2f",tip)
        totalAmount.text=String(format:"$%.2f",total)
        perPersonAmount.text=String(format:"$%.2f",total/stepperButton.value)
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateSlideTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let tipPercentages = Double(tipSlider.value)
        let tip = bill*tipPercentages
        let total = bill+tip
        tipAmount.text=String(format:"$%.2f",tip)
        totalAmount.text=String(format:"$%.2f",total)
        perPersonAmount.text=String(format:"$%.2f",total/stepperButton.value)
        let defaults = UserDefaults.standard
        defaults.set(bill,forKey:"Bill")
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        tipSlider.value=Float(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmount.text=String(format:"$%.2f",tip)
        totalAmount.text=String(format:"$%.2f",total)
        perPersonAmount.text=String(format:"$%.2f",total/stepperButton.value)
        
        let defaults = UserDefaults.standard
        defaults.set(bill,forKey:"Bill")
        
    }
    @IBAction func stepper(_ sender: UIStepper) {
        partySize.text = String(Int(sender.value))
        let bill = Double(billAmount.text!) ?? 0
        let tipPercentages = Double(tipSlider.value)
        let tip = bill*tipPercentages
        let total = bill+tip
        
        let defaults = UserDefaults.standard
        defaults.set(bill,forKey:"Bill")
        
        perPersonAmount.text=String(format:"$%.2f",total/sender.value)
        
    }
    
    @IBAction func insertAmount(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let tipPercentages = Double(tipSlider.value)
        let tip = bill*tipPercentages
        let total = bill+tip
        
        let defaults = UserDefaults.standard
        defaults.set(bill,forKey:"Bill")
        
        tipAmount.text=String(format:"$%.2f",tip)
        totalAmount.text=String(format:"$%.2f",total)
        perPersonAmount.text=String(format:"$%.2f",total/stepperButton.value)
    }
}

