//
//  ext MainVC + Stop.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController {
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {

        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        
        isPlaying = false
        isPaused = false
        isStopped = true
        
        timeOnRunning = nil
        digitsLabel.text = "00:00:00"
        
        if isStopped {
            if let playImage = UIImage(systemName: "play.circle.fill") {
                playButton.setImage(playImage, for: .normal)
            }
            if let pauseImage = UIImage(systemName: "pause.circle.fill") {
                pauseButton.setImage(pauseImage, for: .normal)
            }
            if let stopImage = UIImage(systemName: "stop.circle") {
                stopButton.setImage(stopImage, for: .normal)
            }
        }
        
        if currentMode == .Stopwatch {
            digitsPicker.isHidden = false
        }
    }
}
