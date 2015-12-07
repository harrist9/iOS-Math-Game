//
//  AdViewController.swift
//  Square Root
//
//  Created by Thomas on 11/30/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import Foundation
import UIKit
import AdSupport
import AVFoundation


class AdViewController: UIViewController, AdColonyAdDelegate  {
    
    let sourceView = NSUserDefaults.standardUserDefaults().valueForKey("segueSource") as! String
    
    
    override func viewDidLoad() {
        playAd()
    }
    
    func onAdColonyAdStartedInZone(zoneID: String) {
        gameSound.pauseBackgroundMusic()
    }
    
    func onAdColonyAdAttemptFinished(shown: Bool, inZone zoneID: String) {
       gameSound.playBackgroundMusic()
        goBack()
    }
    
    func playAd() {
        if sourceView == "MainView" {
            AdColony.playVideoAdForZone(Constants.adcolonyZoneID, withDelegate: self, withV4VCPrePopup: true, andV4VCPostPopup: true)
            
        }else if sourceView == "GameView" {
            AdColony.playVideoAdForZone("vza057a8716d0c4f2d9b", withDelegate: self)
        }
    }
    
    func goBack() {
        if sourceView == "MainView" {
            performSegueWithIdentifier("MainView", sender: nil)
            
        }else if sourceView == "GameView" {
            performSegueWithIdentifier("GameOverView", sender: nil)
        }
       
    }
    
  }