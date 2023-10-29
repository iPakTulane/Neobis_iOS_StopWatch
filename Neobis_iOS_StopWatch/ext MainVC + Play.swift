//
//  ext MainVC + Play.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController {
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        if !isPlaying {
            startedTime = isPaused ? Calendar.current.date(byAdding: timeOnRunning, to: Date()) : Date()
            timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(updateDigits), userInfo: nil, repeats: true)
            isPlaying = true
            isPaused = false
            isStopped = false
            
            if isPlaying {
                if let playImage = UIImage(systemName: "play.circle") {
                    playButton.setImage(playImage, for: .normal)
                }
                if let pauseImage = UIImage(systemName: "pause.circle.fill") {
                    pauseButton.setImage(pauseImage, for: .normal)
                }
                if let stopImage = UIImage(systemName: "stop.circle.fill") {
                    stopButton.setImage(stopImage, for: .normal)
                }
            }
        }
    }
    
    @objc func updateDigits() {
        let userCalendar = Calendar.current
        let currentTime = Date()
        
        let timeLeft = userCalendar.dateComponents([.hour, .minute, .second], from: (currentMode == .Timer ? startedTime : currentTime), to: currentMode == .Timer ? currentTime : startedTime + givenTime)
        
        digitsLabel.text = "\(String(format: "%02d", timeLeft.hour!)):\(String(format: "%02d", timeLeft.minute!)):\(String(format: "%02d", timeLeft.second!))"
        
        if currentMode == .Stopwatch && timer != nil && timeLeft.hour == 0 && timeLeft.minute == 0 && timeLeft.second == 0 {
            stopButtonTapped(stopButton)
        }
    }
}
