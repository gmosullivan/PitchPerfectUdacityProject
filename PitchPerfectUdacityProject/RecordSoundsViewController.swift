//
//  ViewController.swift
//  PitchPerfectUdacityProject
//
//  Created by Gareth O'Sullivan on 27/03/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    
    @IBOutlet weak var recordSoundsButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordSounds() {
        print("record button was pressed")
    }
    
    @IBAction func stopRecording() {
        print("stop button was pressed")
    }

}

