//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Willie Strickland on 4/16/15.
//  Copyright (c) 2015 Willie Strickland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    

	var allBalloons:[Balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fillBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fillBalloons() {
        
        var randomIndex = 0
        var count = 0
        
        for count; count < 100; count++ {
            var balloon = Balloon()
            balloon.balloonNumber = count
            randomIndex = Int(arc4random_uniform(UInt32(4)))
        
                        switch randomIndex {
                        case 0 :
                            balloon.balloonImage = UIImage(named: "RedBalloon1.jpg")
                        case 1 :
                            balloon.balloonImage = UIImage(named: "RedBalloon2.jpg")
                        case 2 :
                            balloon.balloonImage = UIImage(named: "RedBalloon3.jpg")
                        default  :
                            balloon.balloonImage = UIImage(named: "RedBalloon4.jpg")
                        }
            allBalloons.append(balloon)
        }
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
   
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(allBalloons.count)))
        } while currentIndex == randomIndex

        currentIndex = randomIndex
        let currentBalloon = allBalloons[currentIndex]

        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            self.backgroundImageView.image = currentBalloon.balloonImage
            }, completion: { (finished: Bool) -> () in
        })
        if currentIndex == 0 {
            self.balloonsLabel.text = "\(currentIndex + 1) balloon"
        }else{
            self.balloonsLabel.text = "\(currentIndex + 1) balloons"
        }
//        println("Balloon \(currentBalloon.balloonNumber + 1)    \(currentBalloon.balloonImage)")
    }
}

