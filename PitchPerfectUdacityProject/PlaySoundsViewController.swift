//
//  PlaySoundsViewController.swift
//  PitchPerfectUdacityProject
//
//  Created by Gareth O'Sullivan on 27/03/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var halfSpeedButton: UIButton!
    @IBOutlet weak var doubleSpeedButton: UIButton!
    @IBOutlet weak var thirdSpeedButton: UIButton!
    @IBOutlet weak var tripleSpeedButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    var rate: Double = 1
    var pitch = 0
    var echo = false
    var reverb = false
    
    
    enum ButtonType: Int { case halfSpeed = 0, doubleSpeed, thirdSpeed, tripleSpeed, lowPitch, highPitch, echo, reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setButtonEffect (_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .halfSpeed:
                rate = 0.5
            case .doubleSpeed:
                rate = 2
            case .thirdSpeed:
                rate = 0.33
            case .tripleSpeed:
                rate = 3
            case .lowPitch:
                pitch = -1000
            case .highPitch:
                pitch = 1000
            case .echo:
                echo = true
            case .reverb:
                reverb = true
        }
        configureUI(.notPlaying)
    }
    
    @IBAction func playButtonPressed() {
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed() {
        resetEffects()
        configureUI(.notPlaying)
    }

}
