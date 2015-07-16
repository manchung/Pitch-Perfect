//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Manch Hon on 7/13/15.
//  Copyright (c) 2015 Manch Hon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var recordingLabel: UILabel!
    @IBAction func recordAudio(sender: UIButton) {
        // toggle
        recordingLabel.hidden = false
    }

    @IBAction func stopRecord(sender: AnyObject) {
        recordingLabel.hidden = true
    }
}

