//
//  ViewController.swift
//  PitchPerfectUdacityProject
//
//  Created by Gareth O'Sullivan on 27/03/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    
    @IBOutlet weak var recordSoundsButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var isRecording = false
    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UI Buttons

    @IBAction func recordSounds() {
        isRecording = true
        configureUI()
    }
    
    @IBAction func stopRecording() {
        isRecording = false
        configureUI()
    }
    
    //MARK:- Functions
    
    func configureUI() {
        if isRecording {
            recordSoundsButton.isEnabled = false
            stopRecordingButton.isEnabled = true
            statusLabel.text = "Recording in Progress"
        } else {
            recordSoundsButton.isEnabled = true
            stopRecordingButton.isEnabled = false
            statusLabel.text = "Tap to record"
        }
    }

}

