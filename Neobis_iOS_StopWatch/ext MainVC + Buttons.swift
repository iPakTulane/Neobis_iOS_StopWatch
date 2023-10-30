//
//  ext MainVC + Buttons.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 29/10/23.
//

import UIKit

extension MainViewController {
    
    func setupButtonsViews() {
    
        let buttonSize = CGSize(width: 80, height: 80)
        for button in [playButton, pauseButton, stopButton] {
            if let button = button {
                button.clipsToBounds = true
                button.frame = CGRect(origin: button.frame.origin, size: buttonSize)
                button.imageView?.contentMode = .scaleAspectFill
            }
        }
    }
}
