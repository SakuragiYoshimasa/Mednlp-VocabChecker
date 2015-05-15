//
//  TitleViewController.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import UIKit

class TitleViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = ConstShared.keyColor
        
        let titleImageView:UIImageView = UIImageView(frame: self.view.bounds)
        titleImageView.image = UIImage(named: "title.png")
        self.view.addSubview(titleImageView)
        
        let startButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*3/4, height: self.view.frame.width/3))
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold",size: CGFloat(self.view.frame.width/10))
        startButton.layer.position=CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-200)
        startButton.setTitle("はじめる", forState: UIControlState.Highlighted)
        startButton.setTitleColor(ConstShared.keyColor, forState: UIControlState.Highlighted)
        startButton.setTitle("はじめる", forState: UIControlState.Normal)
        startButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        startButton.addTarget(self, action: "StartVocabCheck:", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.addTarget(self, action: "PressButton:", forControlEvents: UIControlEvents.TouchDown)
        startButton.addTarget(self, action: "ReleaseButton:", forControlEvents: UIControlEvents.TouchDragOutside)
        startButton.addTarget(self, action: "PressButton:", forControlEvents: UIControlEvents.TouchDragInside)
        
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 20.0
        
        startButton.backgroundColor = UIColor.clearColor()
        startButton.layer.borderColor = UIColor.orangeColor().CGColor
        startButton.layer.borderWidth = 1.0
        self.view.addSubview(startButton)
        
    }
    
    func ReleaseButton(sender: UIButton!){
        sender.backgroundColor = UIColor.clearColor()
    }
    
    func PressButton(sender: UIButton!){
        sender.backgroundColor = UIColor.orangeColor()
    }
    
    func StartVocabCheck(sender: UIButton!){
        sender.backgroundColor = UIColor.clearColor()
        let tutorialViewController:TutorialViewController = TutorialViewController()
        self.presentViewController(tutorialViewController, animated: true, completion: nil)
    }
}