//
//  TutorialViewController.swift
//  Mednlp-VocabChecker
//
//  Created by 山口 智生 on 2015/05/07.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import UIKit

class TutorialViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor=ConstShared.keyColor
        
        
        let explainView: UITextView! = UITextView(frame:CGRectMake(0,50,self.view.bounds.width, self.view.bounds.height-210))
        explainView.backgroundColor=UIColor.clearColor()
        explainView.font=UIFont.systemFontOfSize(20)
        explainView.text="コトバカリとは・・・\n\nコトバカリ(言秤)とは、日常の会話の単語数と語彙数とを測定することにより、潜在語彙数を推定、認知症の可能性を判定するアプリケーションです。\n使い方は、下の「診断開始」ボタンを押した後、キーボードの音声入力ボタン（🎤マーク）を押して、普段通り話すだけ！\n音声入力が途中で切れたら、もう一度音声入力ボタンをおして再開してください。\n適当なところで終了して、「完了」をおせば結果発表！\n早速診断してみよう！"
        explainView.editable=false
        self.view.addSubview(explainView)
        
        
        
        let startButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*3/4, height: self.view.frame.width/3))
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold",size: CGFloat(self.view.frame.width/10))
        startButton.layer.position=CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-100)
        startButton.setTitle("診断開始", forState: UIControlState.Highlighted)
        startButton.setTitleColor(ConstShared.keyColor, forState: UIControlState.Highlighted)
        startButton.setTitle("診断開始", forState: UIControlState.Normal)
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
        let vocabCheckViewController:VocabCheckerViewController = VocabCheckerViewController()
        self.presentViewController(vocabCheckViewController, animated: true, completion: nil)
    }
}
