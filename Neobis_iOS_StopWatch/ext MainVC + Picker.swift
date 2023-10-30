//
//  ext MainVC + Picker.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func setupPickerView() {
        digitsPicker.isHidden = true
        digitsPicker.delegate = self
        digitsPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hour = Int(pickerView.selectedRow(inComponent: 0))
        let minute = Int(pickerView.selectedRow(inComponent: 1))
        let second = Int(pickerView.selectedRow(inComponent: 2))
        
        digitsLabel.text = "\(String(format: "%02d", hour)):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
        givenTimeInterval = TimeInterval(hour * secondsInHour + minute * 60 + second)
    }
    
}
