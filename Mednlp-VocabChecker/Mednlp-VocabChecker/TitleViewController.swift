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
    
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let titleLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        titleLabel.text = "Title"
        self.view.addSubview(titleLabel)
        
        let startButton:UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        startButton.setTitle("Start", forState: UIControlState.Highlighted)
        startButton.addTarget(self, action: "StartVocabCheck", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.backgroundColor = UIColor.blackColor()
        self.view.addSubview(startButton)
    }
    
    func StartVocabCheck(){
        
    }
}