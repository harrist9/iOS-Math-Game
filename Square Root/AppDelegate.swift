//
//  AppDelegate.swift
//  Square Root
//
//  Created by Thomas on 11/19/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AdColonyDelegate, ChartboostDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    //Starts Background Music

       gameSound.playBackgroundMusic()
        
    //Initialize Defaults
        
        if let starTotal = NSUserDefaults.standardUserDefaults().valueForKey("starTotal") as? Int {
            print("Total Stars is: \(starTotal)")
        }else {
            print("setting Default value for starTotal")
            NSUserDefaults.standardUserDefaults().setValue(0, forKey: "starTotal")
        }
        
        if let highScore = NSUserDefaults.standardUserDefaults().valueForKey("highScore") as? Int {
           print("The Current HighScore is: \(highScore)")
        }else {
            print("setting Default value for highScore")
            NSUserDefaults.standardUserDefaults().setValue(0, forKey: "highScore")
        }
        
        if let heartsTotalCount = NSUserDefaults.standardUserDefaults().valueForKey("heartsTotal") as? Int {
            print("Total Hearts are:  \(heartsTotalCount)")
        }else {
           print("setting Default value for hearts")
           NSUserDefaults.standardUserDefaults().setValue(3, forKey: "heartsTotal")
        }
        
        
    //Initialize the Chartboost Library
        
       
      //  Chartboost.startWithAppId(<#T##appId: String!##String!#>, appSignature: <#T##String!#>, delegate: <#T##ChartboostDelegate!#>)
        Chartboost.startWithAppId("56623c38f789821a55aa585d", appSignature: "1dc259b4d3589a26d5b36583bef6b504ff3e32df", delegate: self)
        Chartboost.setShouldRequestInterstitialsInFirstSession(false)
        
    //Configure AdColony once on app launch
        
        AdColony.configureWithAppID(Constants.adcolonyAppID, zoneIDs: [Constants.adcolonyZoneID, "vz5a4a799e29cd49e0a2", "vza057a8716d0c4f2d9b"], delegate: self, logging: true)
        
        
        
        
        return true
        
    }
    
   
    //=============================================
    // MARK:- AdColony V4VC
    //=============================================
    
    /**
    Callback activated when a V4VC currency reward succeeds or fails
    This implementation is designed for client-side virtual currency without a server
    It uses NSUserDefaults for persistent client-side storage of the currency balance
    For applications with a server, contact the server to retrieve an updated currency balance
    On success, posts an NSNotification so the rest of the app can update the UI
    On failure, posts an NSNotification so the rest of the app can disable V4VC UI elements
    */
    func onAdColonyV4VCReward(success: Bool, currencyName: String, currencyAmount amount: Int32, inZone zoneID: String)
    {
        NSLog("AdColony zone: %@ reward: %@ amount: %i", zoneID, success ? "YES" : "NO", amount)
        
        if success {
            let storage = NSUserDefaults.standardUserDefaults()
            
            //Get currency balance from persistent storage and update it
            var balance:UInt32
            if let wrappedBalance = storage.objectForKey(Constants.currencyBalance) as! NSNumber? {
                balance = wrappedBalance.unsignedIntValue
            } else {
                balance = 0
            }
            balance += UInt32(amount)
            
            //Persist the currency balance
            storage.setValue(NSNumber(unsignedInt: balance), forKey: Constants.currencyBalance)
            storage.synchronize()
            
            //Post a notification so the rest of the app knows the balance changed
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.currencyBalanceChange, object: nil)
        }
            
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

