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
        

        self.view.backgroundColor = UIColor.whiteColor()
        let scoreLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        scoreLabel.textColor = UIColor.blackColor()
        scoreLabel.text = "Score:" + String(stringInterpolationSegment: ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
        self.view.addSubview(scoreLabel)
        
        let backButton:UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        backButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        backButton.setTitle("Back to title", forState: UIControlState.Normal)
        backButton.addTarget(self, action: "BackToTitle", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(backButton)
        
    }
    
    func BackToTitle(){
        let titleViewController:TitleViewController = TitleViewController()
        self.presentViewController(titleViewController, animated: false, completion: nil)
    }
    
}
