//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Parker Vines on 6/24/24.
//

import UIKit

class CurrencySelectionController: UIViewController {

    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var currencySwitch1: UISwitch!
    @IBOutlet weak var currencySwitch2: UISwitch!
    @IBOutlet weak var currencySwitch3: UISwitch!
    @IBOutlet weak var currencySwitch4: UISwitch!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            errorLabel.text = "Please enter a valid integer amount."
            errorLabel.isHidden = false
            return
        }
        performSegue(withIdentifier: "showConvertedCurrencies", sender: amount)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConvertedCurrencies", let destinationVC = segue.destination as? ConvertedCurrenciesController {
            destinationVC.amount = sender as? Int
            destinationVC.selectedCurrencies = [
                currencySwitch1.isOn,
                currencySwitch2.isOn,
                currencySwitch3.isOn,
                currencySwitch4.isOn
            ]
        }
    }
}
