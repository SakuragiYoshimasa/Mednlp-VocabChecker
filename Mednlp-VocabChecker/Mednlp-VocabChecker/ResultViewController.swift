//
//  ResultViewController.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ConstShared.keyColor
        

        let scoreLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        scoreLabel.textColor = UIColor.blackColor()
        scoreLabel.text = "Score:" + String(stringInterpolationSegment: ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
        self.view.addSubview(scoreLabel)
        
        let startButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*3/4, height: self.view.frame.width/3))
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold",size: CGFloat(self.view.frame.width/10))
        startButton.layer.position=CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-100)
        startButton.setTitle("タイトルに戻る", forState: UIControlState.Highlighted)
        startButton.setTitleColor(ConstShared.keyColor, forState: UIControlState.Highlighted)
        startButton.setTitle("タイトルに戻る", forState: UIControlState.Normal)
        startButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        startButton.addTarget(self, action: "BackToTitle:", forControlEvents: UIControlEvents.TouchUpInside)
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
    
    func BackToTitle(sender: UIButton!){
        sender.backgroundColor=UIColor.clearColor()
        //self.dismissViewControllerAnimated(true, completion: {UIApplication.sharedApplication().keyWindow?.rootViewController!.dismissViewControllerAnimated(true, completion: nil)})
        let titleViewController:TitleViewController = TitleViewController()
        self.presentViewController(titleViewController, animated: true, completion: nil)
    }
    
}
