//
//  VocabCheckViewController.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import UIKit

class VocabCheckerViewController:UIViewController,UITextViewDelegate{
    
    var textview:UITextView!
    var movebox:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = ConstShared.keyColor
        
        //let backgroundImageView:UIImageView = UIImageView(frame: self.view.bounds)
        //backgroundImageView.image = UIImage(named: "main.png")
        //self.view.addSubview(backgroundImageView)
        
        let tapRecognazer = UITapGestureRecognizer(target: self, action: "onTap:")
        tapRecognazer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapRecognazer)
        
        ModelManager.getInstance().getVocabCheckModel().getTtrInfo().addObserver(self, forKeyPath: "ttr", options:  NSKeyValueObservingOptions.New, context: nil)
        
        
        //目盛りを作成
        let graduationImageView: UIImageView! = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.bounds.width, self.view.bounds.height), false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetRGBStrokeColor(context, 0,0,0,1.0) // 線の色
        let radiusL: CGFloat = self.view.bounds.width/2+30
        let radiusS: CGFloat = self.view.bounds.width/2-10
        let radiusM: CGFloat = self.view.bounds.width/2+10
        
        let centerX = self.view.bounds.width/2
        let centerY = radiusL + 20
        
        CGContextSetLineWidth(context, 0.5);   // 線の太さ
        for j in 0...50 {
            let i=j-(50-30)/2
            CGContextMoveToPoint(context,centerX + radiusS*cos(CGFloat(M_PI/6 + M_PI / 45 * Double(i))), centerY - radiusS*sin(CGFloat(M_PI/6 + M_PI / 45 * Double(i))))
            CGContextAddLineToPoint(context,centerX + radiusM*cos(CGFloat(M_PI/6 + M_PI / 45 * Double(i))), centerY - radiusM*sin(CGFloat(M_PI/6 + M_PI / 45 * Double(i))))
            CGContextStrokePath(context);  // 描画
        }
        
        CGContextSetLineWidth(context, 1.0);   // 線の太さ
        for j in 0...6 {
            let i = j-(6-6)/2
            CGContextMoveToPoint(context,centerX + radiusS*cos(CGFloat(M_PI/6 + M_PI / 9 * Double(i))), centerY - radiusS*sin(CGFloat(M_PI/6 + M_PI / 9 * Double(i))))
            CGContextAddLineToPoint(context,centerX + radiusL*cos(CGFloat(M_PI/6 + M_PI / 9 * Double(i))), centerY - radiusL*sin(CGFloat(M_PI/6 + M_PI / 9 * Double(i))))
            CGContextStrokePath(context);  // 描画
        }
        let graduationImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        graduationImageView.image=graduationImage
        
        self.view.addSubview(graduationImageView)
        
        
        movebox = UILabel(frame: CGRect(x: 0, y: self.view.bounds.height , width: radiusL*2, height: 5))
        movebox.layer.position=CGPoint(x: centerX,y: centerY)
        movebox.backgroundColor = UIColor.redColor()
        movebox.textColor = UIColor.blueColor()
        self.movebox.transform = CGAffineTransformMakeRotation(CGFloat(0.75 * M_PI * 10 / 9 ))
        movebox.text = ""
        self.view.addSubview(movebox)
        
        
        textview = UITextView(frame: CGRect(x: 0, y: self.view.bounds.height/2, width: self.view.bounds.width, height: 40))
        textview.layer.position=CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height/2)
        textview.backgroundColor = ConstShared.keyColor
        textview.textColor = UIColor.blackColor()
        textview.delegate = self
        textview.returnKeyType = UIReturnKeyType.Done
        textview.font = UIFont.systemFontOfSize(CGFloat(20))
        self.view.addSubview(textview)
        
        
    }

    override func viewWillAppear(animated: Bool) {
        textview.becomeFirstResponder()
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "ttr" {
            //println("change ttr")
            println(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
            
            let angle:CGFloat = CGFloat((ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR() - 0.25) * M_PI * 10 / 9 )
            
            UIView.animateWithDuration(1.0, animations:{() -> Void in
                
                /*self.movebox.layer.bounds.size.width = self.view.bounds.width * CGFloat(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
                },*/
                self.movebox.transform = CGAffineTransformMakeRotation(angle)
                },
                completion:nil
            )
        }
    }
    
    func textViewDidChange(textview: UITextView) {
        if textview.text == nil {
            return
        }
        ModelManager.getInstance().getVocabCheckModel().VocabCheck(textview.text)
        
        //最後が改行であれば画面遷移
        if textview.text != "" {
            if textview.text[textview.text.endIndex.predecessor()] == "\n" {
                let resultViewController:ResultViewController = ResultViewController()
                self.presentViewController(resultViewController, animated: true, completion: nil)
            }
        }
    }
    
    func onTap(recognizer:UIPanGestureRecognizer){
        textview.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        println("textviewDidBeginEditing:" + textview.text)
    }
    func textViewDidEndEditing(textView: UITextView) {
        println("textviewDidEndEditing:" + textview.text)
    }

}