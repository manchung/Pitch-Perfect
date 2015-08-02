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
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var playerNode:AVAudioPlayerNode!
    var audioTimePitch:AVAudioUnitTimePitch!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AVAudioEngine()
        playerNode = AVAudioPlayerNode()
        audioTimePitch = AVAudioUnitTimePitch()
        
        var error:NSError?
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: &error)

        audioEngine.attachNode(playerNode)
        audioEngine.attachNode(audioTimePitch)

        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: &error)
        audioPlayer.enableRate = true
        audioPlayer.prepareToPlay()
    }
    
    @IBAction func stop(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
    }


    @IBAction func playSlow(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func playFast(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        playWithPitch(1000)
    }

    @IBAction func playDarth(sender: UIButton) {
        playWithPitch(-1000)
    }
    
    // helper function to tune the pitch for Chipmunk and Darth Vader effects
    func playWithPitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioTimePitch.pitch = pitch
        
        var mixer = audioEngine.mainMixerNode
        audioEngine.connect(playerNode, to:audioTimePitch, format:mixer.outputFormatForBus(0))
        audioEngine.connect(audioTimePitch, to:mixer, format:mixer.outputFormatForBus(0))
        
        var error:NSError?
        audioEngine.prepare()
        audioEngine.startAndReturnError(&error)
        playerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        playerNode.play()
       
    }
    
}
