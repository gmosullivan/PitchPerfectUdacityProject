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

    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case halfSpeed = 0, doubleSpeed, thirdSpeed, tripleSpeed, lowPitch, highPitch, echo, reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setButtonEffect (_ sender: UIButton) {
        print(sender.tag)
    }

}
