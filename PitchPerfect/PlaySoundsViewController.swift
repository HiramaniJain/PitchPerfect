//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Heeral on 10/28/18.
//  Copyright © 2018 heeral. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int
    {
        case slow = 0, fast, echo, reverb, chipmunk, vader
        
    }
    
    @IBAction func playSoundForButton(_sender: UIButton)
    {
        switch(ButtonType(rawValue: _sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_sender: AnyObject)
    {
        stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button:UIButton in [snailButton, rabbitButton, chipmunkButton, vaderButton, echoButton, reverbButton]
        {
            button.contentMode = .scaleAspectFit
            button.imageView?.contentMode = .scaleAspectFit
        }
        
        // Do any additional setup after loading the view.
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
