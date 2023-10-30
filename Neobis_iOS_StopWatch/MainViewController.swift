//
//  MainViewController.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 24/10/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var digitsLabel: UILabel!
    @IBOutlet weak var digitsPicker: UIPickerView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var currentMode = AppMode.timer
    var timer: Timer!
    var playingTime: Date!
    var elapsedTimeComponents: DateComponents!
    var isPlaying = false
    var isPaused = false
    var isStopped = false
    var givenTimeInterval: TimeInterval! = TimeInterval(0)
    let secondsInHour = 3600
    let timerInterval = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
        setupButtonsViews()
    }
}




