//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Manch Hon on 7/22/15.
//  Copyright (c) 2015 Manch Hon. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var movieClip = NSURL(fileURLWithPath: (NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")) ?? "")
        println(movieClip)
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: movieClip, error: &error)
        audioPlayer.enableRate = true
        audioPlayer.prepareToPlay()
    }
    @IBAction func playSlow(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playFast(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    
    @IBAction func stop(sender: UIButton) {
        audioPlayer.stop()
    }
}
