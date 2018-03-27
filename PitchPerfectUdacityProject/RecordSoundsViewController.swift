//
//  ViewController.swift
//  PitchPerfectUdacityProject
//
//  Created by Gareth O'Sullivan on 27/03/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordSoundsButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var isRecording = false
    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK:- UI Buttons

    @IBAction func recordSounds() {
        
        
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        
        isRecording = true
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        configureUI()
        
    }
    
    @IBAction func stopRecording() {
        
        let session = AVAudioSession.sharedInstance()
        
        try! session.setActive(false)
        
        isRecording = false
        audioRecorder.stop()
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
    
    //MARK:- Audio Recorder Delegate
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Audio recorder encountered a problem recording.")
        }
    }
    
    //MARK:- Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsViewController = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsViewController.recordedAudioURL = recordedAudioURL
        }
    }

}

