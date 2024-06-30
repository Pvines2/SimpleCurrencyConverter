//
//  ConvertedCurrencyController.swift
//  CurrencyConverter
//
//  Created by Parker Vines on 6/27/24.
//

import UIKit

class ConvertedCurrenciesController: UIViewController {

    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var currency3Label: UILabel!
    @IBOutlet weak var currency4Label: UILabel!
    
    var amount: Int?
    var selectedCurrencies: [Bool]?


    // Static conversion rates for simplicity
        let conversionRates: [String: Double] = [
            "EUR": 0.85,  // USD to EUR
            "JPY": 110.0, // USD to JPY
            "GBP": 0.75,  // USD to GBP
            "AUD": 1.35   // USD to AUD
        
        ]
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
        }

    func updateUI() {
            guard let amount = amount, let selectedCurrencies = selectedCurrencies else { return }
            amountLabel.text = "Amount in USD: \(amount)"
            
            let currencyLabels = [currency1Label, currency2Label, currency3Label, currency4Label]
            let currencyKeys = ["EUR", "JPY", "GBP", "AUD"]
            
            for (index, isSelected) in selectedCurrencies.enumerated() {
                if isSelected {
                    if let rate = conversionRates[currencyKeys[index]] {
                        let convertedAmount = Double(amount) * rate
                        currencyLabels[index]?.text = "\(currencyKeys[index]): \(String(format: "%.2f", convertedAmount))"
                    }
                } else {
                    currencyLabels[index]?.text = ""
                }
            }
        }
    }

