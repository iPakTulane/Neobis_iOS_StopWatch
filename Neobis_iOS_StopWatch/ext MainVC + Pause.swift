//
//  ext MainVC + Pause.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController {
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if isPlaying && !isPaused{
            elapsedTimeComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: (playingTime))
            timer.invalidate()
            isPaused = true
            isPlaying = false
            isStopped = false
            
            if isPaused {
                if let playImage = UIImage(systemName: "play.circle.fill") {
                    playButton.setImage(playImage, for: .normal)
                }
                if let pauseImage = UIImage(systemName: "pause.circle") {
                    pauseButton.setImage(pauseImage, for: .normal)
                }
                if let stopImage = UIImage(systemName: "stop.circle.fill") {
                    stopButton.setImage(stopImage, for: .normal)
                }
            }
        }
    }
}
