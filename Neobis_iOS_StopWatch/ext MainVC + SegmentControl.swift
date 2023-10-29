//
//  ext MainVC + SegmentControl.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

//extension MainViewController {
//    
//    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
//        
//        if (currentMode == AppMode.Timer) {
//            if isPlaying || isPaused {
//                stopButtonTapped(stopButton)
//            }
//            currentMode = AppMode.Stopwatch
//            digitsPicker.isHidden = false
//            logoImage.image = UIImage(systemName: "stopwatch")
//        } else {
//            if isPlaying || isPaused {
//                stopButtonTapped(stopButton)
//            }
//            currentMode = AppMode.Timer
//            digitsPicker.isHidden = true
//            logoImage.image = UIImage(systemName: "timer")
//        }
//    }
//}
//
//

extension MainViewController {
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        stopTimerAndResetUI()
        
        if (currentMode == AppMode.Timer) {
            currentMode = AppMode.Stopwatch
            digitsPicker.isHidden = false
            logoImage.image = UIImage(systemName: "stopwatch")
        } else {
            currentMode = AppMode.Timer
            digitsPicker.isHidden = true
            logoImage.image = UIImage(systemName: "timer")
        }
    }
    
    func stopTimerAndResetUI() {
        
        if isPlaying || isPaused {
            stopButtonTapped(stopButton)
        }
        
//        if isPlaying || isPaused {
//            timer.invalidate()
//            isPlaying = false
//            isPaused = false
//            isStopped = true
//            timeOnRunning = nil
//            digitsLabel.text = "00:00:00"
//            
//            if isStopped {
//                if let playImage = UIImage(systemName: "play.circle.fill") {
//                    playButton.setImage(playImage, for: .normal)
//                }
//                if let pauseImage = UIImage(systemName: "pause.circle.fill") {
//                    pauseButton.setImage(pauseImage, for: .normal)
//                }
//                if let stopImage = UIImage(systemName: "stop.circle") {
//                    stopButton.setImage(stopImage, for: .normal)
//                }
//            }
//            
//            if currentMode == .Stopwatch {
//                digitsPicker.isHidden = false
//            }
//        }
    }
}
