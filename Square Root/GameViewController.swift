//
//  GameViewController.swift
//  Square Root
//
//  Created by Thomas on 11/19/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import iAd

class GameViewController: UIViewController {
    
//Outlets
    
    @IBOutlet weak var answer0Btn: UIButton!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet weak var heartLbl: UILabel!
    
    
//Variable & Properties
    
    var firstNumber = 0
    var secondNumber = 0
    var answer = 0
    var stringAnswer = ""
    var level = 1
    var questionRandom = 0
    
    var wrongAnswer1 = 0
    var wrongAnswer2 = 0
    var wrongAnswer3 = 0
    
    var stringAnswer1 = "+"
    var stringAnswer2 = "-"
    var stringAnswer3 = "x"
    var stringAnswer4 = "/"
    
    var scoreCount = 0
    var starCount = 0
    var heartCount = NSUserDefaults.standardUserDefaults().valueForKey("heartsTotal") as! Int
   
    var timeStart = 10
    let timeReward = 3
    
    var timer = NSTimer()
    var adBanner: ADBannerView!
    var correctSound: AVAudioPlayer!
    var wrongSound: AVAudioPlayer!
    
//Actions
    
    @IBAction func answer0BtnPressed(sender: AnyObject) {
        if questionRandom == 0 || questionRandom == 1 || questionRandom == 3 || questionRandom == 4 {
        if answer0Btn.currentTitle == "\(answer)" {
            answerRight()
            
        }else {
            answerWrong()
            }
        }else if questionRandom == 2 || questionRandom == 5 {
        if answer0Btn.currentTitle == stringAnswer {
            answerRight()
            
        }else {
            answerWrong()
        }
    }
        
    }
    
    @IBAction func answer1BtnPressed(sender: AnyObject) {
        if questionRandom == 0 || questionRandom == 1 || questionRandom == 3 || questionRandom == 4 {
            if answer1Btn.currentTitle == "\(answer)" {
                answerRight()
                
            }else {
                answerWrong()
            }
        }else if questionRandom == 2 || questionRandom == 5 {
            if answer1Btn.currentTitle == stringAnswer {
                answerRight()
                
            }else {
                answerWrong()
            }
        }
    }
    
    @IBAction func answer2BtnPressed(sender: AnyObject){
        if questionRandom == 0 || questionRandom == 1 || questionRandom == 3 || questionRandom == 4 {
            if answer2Btn.currentTitle == "\(answer)" {
                answerRight()
                
            }else {
                answerWrong()
            }
        }else if questionRandom == 2 || questionRandom == 5 {
            if answer2Btn.currentTitle == stringAnswer {
                answerRight()
                
            }else {
                answerWrong()
            }
        }
    }
    
    @IBAction func answer3BtnPressed(sender: AnyObject) {
        if questionRandom == 0 || questionRandom == 1 || questionRandom == 3 || questionRandom == 4 {
            if answer3Btn.currentTitle == "\(answer)" {
                answerRight()
                
            }else {
                answerWrong()
            }
        }else if questionRandom == 2 || questionRandom == 5 {
            if answer3Btn.currentTitle == stringAnswer {
                answerRight()
                
            }else {
                answerWrong()
            }
        }
    }
    
//Functions
    
    func answerWrong() {
        playwrongSound()
        timeStart = timeStart - timeReward
        if scoreCount > 0 {
        scoreCount = scoreCount - 1
        }else {
            scoreCount = 0
        }
        scoreLbl.text = "Score: \(scoreCount)"
        updateHearts()
        randomNumbers()
        
    }
    
    func answerRight() {
        playcorrectSound()
        timeStart = timeStart + timeReward
        scoreCount = scoreCount + 2
        scoreLbl.text = "Score: \(scoreCount)"
        starCount = starCount + 1
        starLbl.text = "\(starCount)"
        randomNumbers()
    }
    
    func updateHearts() {
        if heartCount > 0 {
        heartCount = heartCount - 1
        heartLbl.text = "\(heartCount)"
        } else if heartCount == 0 {
            gameOver()
        }
    }
    
    func playcorrectSound(){
        correctSound.volume = 0.075
        correctSound.play()
    }
    
    func playwrongSound(){
        wrongSound.volume = 0.075
        wrongSound.play()
    }

    func answerRandom() {
        
        if questionRandom == 0 {
            answer = firstNumber + secondNumber
        }else if questionRandom == 1 {
            answer = firstNumber - secondNumber
        }else if questionRandom == 2 {
            let numA = Int(arc4random_uniform(1))
            if numA == 0 {
                answer = firstNumber + secondNumber
                stringAnswer = "+"
            }else if numA == 1 {
                answer = firstNumber - secondNumber
                stringAnswer = "-"
            }
        }else if questionRandom == 3 {
            answer = firstNumber * secondNumber
        }else if questionRandom == 4 {
            answer = firstNumber / secondNumber
        }else if questionRandom == 5 {
            let numB = Int(arc4random_uniform(1))
            if numB == 0 {
                answer = firstNumber * secondNumber
                stringAnswer = "x"
            }else if numB == 1 {
                answer = firstNumber / secondNumber
                stringAnswer = "/"
            }
        }
        
    }
    
    
    func randomNumbers() {
        currentLevel()
        firstNumber = Int(arc4random_uniform(9))
        secondNumber = Int(arc4random_uniform(9))
        wrongAnswer1 = Int(arc4random_uniform(5))
        wrongAnswer2 = Int(arc4random_uniform(11))
        wrongAnswer3 = Int(arc4random_uniform(16))
        question()
       
    }
    
    func currentLevel() {
        if scoreCount < 25 {
            levelLbl.text = "Level: 1"
        }else if scoreCount >= 50 && scoreCount < 20 {
            levelLbl.text = "Level: 2"
            level = 2
        }else if scoreCount >= 75 && scoreCount < 30 {
            levelLbl.text = "Level: 3"
            level = 3
        }else if scoreCount >= 150 && scoreCount < 40 {
            levelLbl.text = "Level: 4"
            level = 4
        }else if scoreCount >= 200 && scoreCount < 50 {
            levelLbl.text = "Level: 5"
            level = 5
        }else if scoreCount >= 300 {
            levelLbl.text = "Level: 6"
            level = 6
        }
    }
    
    func LogicCheck(){
        repeat{
            wrongAnswer3 = Int(arc4random_uniform(18))
            wrongAnswer2 = Int(arc4random_uniform(14))
            wrongAnswer1 = Int(arc4random_uniform(18))
        }while wrongAnswer1 == wrongAnswer2 || wrongAnswer1 == wrongAnswer3 || wrongAnswer2 == wrongAnswer3 && wrongAnswer1 == answer || wrongAnswer2 == answer || wrongAnswer3 == answer
    }
    
    func question() {
        
        if level == 1 {
            questionRandom = 0
            answerRandom()
            LogicCheck()
            randomQuestion()
        }else if level == 2 {
            questionRandom = Int(arc4random_uniform(1))
            answerRandom()
            LogicCheck()
            randomQuestion()
        }else if level == 3 {
            questionRandom = Int(arc4random_uniform(2))
            answerRandom()
            LogicCheck()
            randomQuestion()
        }else if level == 4 {
            questionRandom = Int(arc4random_uniform(3))
            answerRandom()
            LogicCheck()
            randomQuestion()
        }else if level >= 5 {
            questionRandom = Int(arc4random_uniform(4))
            answerRandom()
            LogicCheck()
            randomQuestion()
//        }else if level >= 6 {
//            questionRandom = Int(arc4random_uniform(5))
//            answerRandom()
//            randomQuestion()
        }
    }
    
    func randomQuestion() {
        if questionRandom == 0 {
            questionLbl.text = "\(firstNumber) + \(secondNumber) = ?"
        }else if questionRandom == 1 {
            questionLbl.text = "\(firstNumber) - \(secondNumber) = ?"
        }else if questionRandom == 2 {
            questionLbl.text = "\(firstNumber) ? \(secondNumber) = \(answer)"
        }else if questionRandom == 3 {
            questionLbl.text = "\(firstNumber) x \(secondNumber) = ?"
        }else if questionRandom == 4 {
            questionLbl.text = "\(firstNumber) ? \(secondNumber) = \(answer)"
           // questionLbl.text = "\(firstNumber) / \(secondNumber) = ?"
        //}else if questionRandom == 5 {
          //  questionLbl.text = "\(firstNumber) ? \(secondNumber) = \(answer)"
        }
        printButtonText()
    }
    
    func printButtonText() {
        if questionRandom == 0 || questionRandom == 1 || questionRandom == 3 /*|| questionRandom == 4*/ {
            let randomCase = Int(arc4random_uniform(4))
            switch randomCase {
            case 0:
                self.answer0Btn.setTitle("\(answer)", forState: UIControlState.Normal)
                self.answer1Btn.setTitle("\(wrongAnswer1)", forState: UIControlState.Normal)
                self.answer2Btn.setTitle("\(wrongAnswer2)", forState: UIControlState.Normal)
                self.answer3Btn.setTitle("\(wrongAnswer3)", forState: UIControlState.Normal)
                
            case 1:
                self.answer0Btn.setTitle("\(wrongAnswer1)", forState: UIControlState.Normal)
                self.answer1Btn.setTitle("\(answer)", forState: UIControlState.Normal)
                self.answer2Btn.setTitle("\(wrongAnswer2)", forState: UIControlState.Normal)
                self.answer3Btn.setTitle("\(wrongAnswer3)", forState: UIControlState.Normal)
                
            case 2:
                self.answer0Btn.setTitle("\(wrongAnswer2)", forState: UIControlState.Normal)
                self.answer1Btn.setTitle("\(wrongAnswer1)", forState: UIControlState.Normal)
                self.answer2Btn.setTitle("\(answer)", forState: UIControlState.Normal)
                self.answer3Btn.setTitle("\(wrongAnswer3)", forState: UIControlState.Normal)
                
            case 3:
            
                self.answer0Btn.setTitle("\(wrongAnswer3)", forState: UIControlState.Normal)
                self.answer1Btn.setTitle("\(wrongAnswer1)", forState: UIControlState.Normal)
                self.answer2Btn.setTitle("\(wrongAnswer2)", forState: UIControlState.Normal)
                self.answer3Btn.setTitle("\(answer)", forState: UIControlState.Normal)
            case 4:
                self.answer0Btn.setTitle("\(wrongAnswer2)", forState: UIControlState.Normal)
                self.answer1Btn.setTitle("\(wrongAnswer1)", forState: UIControlState.Normal)
                self.answer2Btn.setTitle("\(answer)", forState: UIControlState.Normal)
                self.answer3Btn.setTitle("\(wrongAnswer3)", forState: UIControlState.Normal)
            default:break
            }
        }else if questionRandom == 2 || questionRandom == 4 {
            answer0Btn.setTitle(stringAnswer1, forState: UIControlState.Normal)
            answer1Btn.setTitle(stringAnswer2, forState: UIControlState.Normal)
            answer2Btn.setTitle(stringAnswer3, forState: UIControlState.Normal)
            answer3Btn.setTitle(stringAnswer4, forState: UIControlState.Normal)
        }
        
    }
    
    
    func gameOver() {
        self.timer.invalidate()
        let gameScore = scoreCount
        let highScore = NSUserDefaults.standardUserDefaults().valueForKey("highScore") as! Int
        let gameStarCount = starCount
        let totalStars = NSUserDefaults.standardUserDefaults().valueForKey("starTotal") as! Int
        let overalltotal = gameStarCount + totalStars
        let gameHeartCount = heartCount
        let heartsPassedIn = NSUserDefaults.standardUserDefaults().valueForKey("heartsTotal") as! Int
        NSUserDefaults.standardUserDefaults().setValue(overalltotal, forKey: "starTotal")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if gameHeartCount < heartsPassedIn {
            NSUserDefaults.standardUserDefaults().setValue(3, forKey: "heartsTotal")
            NSUserDefaults.standardUserDefaults().setObject(3, forKey: Constants.currencyBalance)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if gameScore > highScore {
            NSUserDefaults.standardUserDefaults().setValue(gameScore, forKey: "highScore")
            GCHelper.sharedInstance.reportLeaderboardIdentifier("easy_leaderboard", score: gameScore)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        performSegueWithIdentifier("AdView", sender: nil)
    }
    
    
    func updateTimer() {
        timeStart--
        if timeStart >= 60 {
            timeStart = 60
        }else if timeStart >= 0 {
            timerLbl.text = "\(timeStart)"
        }else {
            gameOver()
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        heartLbl.text = ("\(heartCount)")
        NSUserDefaults.standardUserDefaults().setValue("GameView", forKey: "segueSource")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("correct", ofType: "m4a")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try correctSound = AVAudioPlayer(contentsOfURL: soundUrl)
            correctSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let wrongSoundpath = NSBundle.mainBundle().pathForResource("wrong", ofType: "m4a")
        let wrongSoundUrl = NSURL(fileURLWithPath: wrongSoundpath!)
        
        do {
            try wrongSound = AVAudioPlayer(contentsOfURL: wrongSoundUrl)
            wrongSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        super.viewDidLoad()
        randomNumbers()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true);
    }
    
}

