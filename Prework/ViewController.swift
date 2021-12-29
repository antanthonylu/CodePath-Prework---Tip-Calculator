//
//  ViewController.swift
//  Prework
//
//  Created by user193417 on 12/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!

    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!

    @IBOutlet weak var splitTipLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // Show keyboard by default
        billAmountTextField.becomeFirstResponder()
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let partySize = Double(partySizeLabel.text!) ?? 0
        let splitTip = tip / partySize
        let splitBill = bill / partySize
        let splitTotal = splitBill + splitTip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        splitTipLabel.text = String(format: "$%.2f", splitTip)
        splitTotalLabel.text = String(format: "$%.2f", splitTotal)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        partySizeLabel.text = Int(sender.value).description
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let partySize = Double(partySizeLabel.text!) ?? 0
        let splitTip = (bill * tipPercentages[tipControl.selectedSegmentIndex])/partySize
        let splitBill = bill / partySize
        let splitTotal = splitBill + splitTip
        
        splitTipLabel.text = String(format: "$%.2f", splitTip)
        splitTotalLabel.text = String(format: "$%.2f", splitTotal)
    }
    
}

