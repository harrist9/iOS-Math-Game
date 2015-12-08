//
//  ViewController.swift
//  Square Root
//
//  Created by Thomas on 11/18/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import UIKit
import AVFoundation
import GameKit
import iAd
import AdSupport

class ViewController: UIViewController, AdColonyAdDelegate, ADBannerViewDelegate  {
//Outlets
    
    
    @IBOutlet weak var EasyBestLbl: UILabel!
    @IBOutlet weak var HeartLbl: UILabel!
    @IBOutlet weak var StarLbl: UILabel!
    
//Variables
    
    var adBanner: ADBannerView!
   
    
    
//Functions
    
    func addObservers()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateCurrencyBalance", name: Constants.currencyBalanceChange, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "zoneReady", name: Constants.zoneReady, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "zoneOff", name: Constants.zoneOff, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "zoneLoading", name: Constants.zoneLoading, object: nil)
    }
    
    func removeObservers()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: Constants.zoneLoading, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: Constants.zoneOff, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: Constants.zoneReady, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: Constants.currencyBalanceChange, object: nil)
    }

    func updateCurrencyBalance()
    {
        //Get currency balance from persistent storage and display it
        if let wrappedBalance = NSUserDefaults.standardUserDefaults().objectForKey(Constants.currencyBalance) as! NSNumber? {
            self.HeartLbl.text = wrappedBalance.stringValue
            NSUserDefaults.standardUserDefaults().setValue(wrappedBalance, forKey: "heartsTotal")
        } else {
            let heartStartingBalance = NSUserDefaults.standardUserDefaults().valueForKey("heartsTotal") as! Int
            self.HeartLbl.text = "\(heartStartingBalance)"
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func updateDefaults() {
        //Updates highScore value to it's label
        
        let highScore = NSUserDefaults.standardUserDefaults().valueForKey("highScore") as! Int
        EasyBestLbl.text = "Best: \(highScore)"
        
        //Updates starTotal value to it's label
        
        let starTotal = NSUserDefaults.standardUserDefaults().valueForKey("starTotal") as! Int
        StarLbl.text = "\(starTotal)"
        
        //Sets segue-source as MainView for ad purposes
        
        NSUserDefaults.standardUserDefaults().setValue("MainView", forKey: "segueSource")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        GCHelper.sharedInstance.authenticateLocalUser()
        return true
    }
    
//Actions
    
    @IBAction func leaderboardBtnPressed(sender: AnyObject) {
        userStarAchievements.updateAchievements()
        GCHelper.sharedInstance.showGameCenter(self, viewState: .Leaderboards)
         //GCHelper.sharedInstance.showGameCenter(self, viewState: .Achievements)
    }
   
    @IBAction func rateUsBtnPressed(sender: AnyObject){
       UIApplication.sharedApplication().openURL(NSURL(string: "itms-apps://itunes.apple.com/app/id1061490024")!)
    }
    
//Override Functions
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.updateDefaults()
        Chartboost.showInterstitial(CBLocationHomeScreen)
        

    }
    
    override func viewDidLoad() {
        self.canDisplayBannerAds = true
        self.updateCurrencyBalance()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addObservers", name: UIApplicationWillEnterForegroundNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "removeObservers", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        self.addObservers()
        super.viewDidLoad()
        GCHelper.sharedInstance.authenticateLocalUser()
       
        }
}

