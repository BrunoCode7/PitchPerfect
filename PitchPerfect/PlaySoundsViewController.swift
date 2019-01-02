//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Baraa Hesham on 1/1/19.
//  Copyright © 2019 Baraa Hesham. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowPitch: UIButton!
    @IBOutlet weak var reverb: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highPitch: UIButton!
    @IBOutlet weak var echo: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    // MARK: - specify the sound for each button
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch (ButtonType(rawValue: sender.tag)!) {
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
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        fastButton.contentMode = .center
        fastButton.imageView?.contentMode = .scaleAspectFit

        lowPitch.contentMode = .center
        lowPitch.imageView?.contentMode = .scaleAspectFit

        reverb.contentMode = .center
        reverb.imageView?.contentMode = .scaleAspectFit

        slowButton.contentMode = .center
        slowButton.imageView?.contentMode = .scaleAspectFit

        highPitch.contentMode = .center
        highPitch.imageView?.contentMode = .scaleAspectFit

        echo.contentMode = .center
        echo.imageView?.contentMode = .scaleAspectFit
        
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
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
