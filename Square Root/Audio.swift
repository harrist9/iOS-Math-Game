//
//  Audio.swift
//  Square Root
//
//  Created by Thomas on 12/6/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import Foundation
import AVFoundation


public class Audio: NSObject, AVAudioPlayerDelegate {
    
    public var backgroundMusicPlayer: AVAudioPlayer?
    
    public func playBackgroundMusic() {
        
        let path = NSBundle.mainBundle().pathForResource("bg", ofType: "m4a")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: soundUrl)
            backgroundMusicPlayer!.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        if let player = backgroundMusicPlayer {
            player.numberOfLoops = -1
            player.delegate = self
            player.volume = 0.05
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player")
        }
    }
    
    public func pauseBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if player.playing {
                    player.pause()
                }
            }
        }
        
    public func resumeBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if !player.playing {
                    player.play()
                }
            }
        }
}

var gameSound = Audio()


