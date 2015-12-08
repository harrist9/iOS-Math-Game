//
//  StarAchievements.swift
//  Square Root
//
//  Created by Thomas on 12/7/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//


public class StarAchievements {
    
     let star10 = 10.0
     let star50 = 50.0
     let star150 = 150.0
     let star500 = 500.0
     let star1000 = 1000.0
     let star5000 = 5000.0
     let star10000 = 10000.0
     let star25000 = 25000.0
     let star50000 = 50000.0
     let star100000 = 100000.0

    public func updateAchievements() {
            let playerStars = NSUserDefaults.standardUserDefaults().valueForKey("starTotal") as! Double
            let percentStar10 = (playerStars / star10) * 100
            let percentStar50 = (playerStars / star50) * 100
            let percentStar150 = (playerStars / star150) * 100
            let percentStar500 = (playerStars / star500) * 100
            let percentStar1000 = (playerStars / star1000) * 100
            let percentStar5000 = (playerStars / star5000) * 100
            let percentStar10000 = (playerStars / star10000) * 100
            let percentStar25000 = (playerStars / star25000) * 100
            let percentStar50000 = (playerStars / star50000) * 100
            let percentStar100000 = (playerStars / star100000) * 100
        if percentStar10 >= 100.0 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star10", percent: 100)
        }else{
            GCHelper.sharedInstance.reportAchievementIdentifier("star10", percent: percentStar10)
        }
        if percentStar50 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star50", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star50", percent: percentStar50)
        }
        if percentStar150 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star150", percent: 100)
        }else{
            GCHelper.sharedInstance.reportAchievementIdentifier("star150", percent: percentStar150)
        }
        if percentStar500 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star500", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star500", percent: percentStar500)
        }
        if percentStar1000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star1000", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star1000", percent: percentStar1000)
        }
        if percentStar5000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star5000", percent: 100)
        }else{
            GCHelper.sharedInstance.reportAchievementIdentifier("star5000", percent: percentStar5000)
        }
        if percentStar10000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star10000", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star10000", percent: percentStar10000)
        }
        if percentStar25000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star25000", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star25000", percent: percentStar25000)
        }
        if percentStar50000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star50000", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star50000", percent: percentStar50000)
        }
        if percentStar100000 >= 100 {
            GCHelper.sharedInstance.reportAchievementIdentifier("star100000", percent: 100)
        }else {
            GCHelper.sharedInstance.reportAchievementIdentifier("star100000", percent: percentStar100000)
        }
    }
}

var userStarAchievements = StarAchievements()