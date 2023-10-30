//
//  ext MainVC + SegmentControl.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController {
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        stopTimerAndResetUI()
        
        if (currentMode == AppMode.timer) {
            currentMode = AppMode.stopwatch
            digitsPicker.isHidden = false
            logoImage.image = UIImage(systemName: "stopwatch")
        } else {
            currentMode = AppMode.timer
            digitsPicker.isHidden = true
            logoImage.image = UIImage(systemName: "timer")
        }
    }
    
    func stopTimerAndResetUI() {
        
        if isPlaying || isPaused {
            stopButtonTapped(stopButton)
        }
    }
}
