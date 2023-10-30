//
//  MainViewController.swift
//  Neobis_iOS_StopWatch
//
//  Created by Igor Pak on 24/10/23.
//

import UIKit

class MainViewController: UIViewController {
    
    enum AppMode {
        case timer
        case stopwatch
    }
    
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
    }
}

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


extension MainViewController {
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        if !isPlaying {
            playingTime = isPaused ? Calendar.current.date(byAdding: elapsedTimeComponents, to: Date()) : Date()
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
        
        let timeLeft = userCalendar.dateComponents([.hour, .minute, .second], from: (currentMode == .timer ? playingTime : currentTime), to: currentMode == .timer ? currentTime : playingTime + givenTimeInterval)
        
        digitsLabel.text = "\(String(format: "%02d", timeLeft.hour!)):\(String(format: "%02d", timeLeft.minute!)):\(String(format: "%02d", timeLeft.second!))"
        
        if currentMode == .stopwatch && timer != nil && timeLeft.hour == 0 && timeLeft.minute == 0 && timeLeft.second == 0 {
            stopButtonTapped(stopButton)
        }
    }
}

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

extension MainViewController {
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {

        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        
        isPlaying = false
        isPaused = false
        isStopped = true
        
        elapsedTimeComponents = nil
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
        
        if currentMode == .stopwatch {
            digitsPicker.isHidden = false
        }
    }
}


