//
//  CurrencyCalculatorViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class CurrencyCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var currencyList:[Currency] = []
    var activeCurrency:Double = 0
    
    @IBOutlet weak var targetCurrencyLabel: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var sourceValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        result.text = "0"
        self.sourceValue.delegate = self

    }
    
    @IBAction func calculate(_ sender: Any) {
        calculate()
    }
    
    //CREATING PICKER VIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return currencyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let currency = currencyList[row]
        return currency.currencyCode
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let currency = currencyList[row]
        activeCurrency = currency.currencyValue
        targetCurrencyLabel.text = currency.currencyCode
        calculate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sourceValue.resignFirstResponder()
        return (true)
    }
    
    func calculate() {
        if sourceValue.text != "" {
            let resultValue = String(Double(sourceValue.text!)! * activeCurrency)
            result.text = resultValue
        }
    }
    
}
