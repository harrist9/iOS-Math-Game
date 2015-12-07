//
//  GameOverViewController.swift
//  Square Root
//
//  Created by Thomas on 11/28/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import Foundation
import UIKit



class GameOverViewController: UIViewController, AdColonyAdDelegate {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.canDisplayBannerAds = true
    }
    
    override func viewDidLoad() {
        
    }
    
}

