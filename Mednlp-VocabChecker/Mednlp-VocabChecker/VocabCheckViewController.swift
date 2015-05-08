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
    var handImageView:UIImageView!
    var statusLabel: UILabel!
    
    var centerX: CGFloat!
    var centerY: CGFloat!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = ConstShared.keyColor
        
        //let backgroundImageView:UIImageView = UIImageView(frame: self.view.bounds)
        //backgroundImageView.image = UIImage(named: "main.png")
        //self.view.addSubview(backgroundImageView)
        
        //これいるか？
        let tapRecognazer = UITapGestureRecognizer(target: self, action: "onTap:")
        tapRecognazer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapRecognazer)
        
        ModelManager.getInstance().getVocabCheckModel().getTtrInfo().addObserver(self, forKeyPath: "ttr", options:  NSKeyValueObservingOptions.New, context: nil)
        
        
        //目盛を作成
        let graduationImageView: UIImageView! = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.bounds.width, self.view.bounds.height), false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetRGBStrokeColor(context, 0,0,0,1.0) // 線の色
        let radiusL: CGFloat = self.view.bounds.width/2+40
        let radiusS: CGFloat = self.view.bounds.width/2
        let radiusM: CGFloat = self.view.bounds.width/2+20
        
        self.centerX = self.view.bounds.width/2
        self.centerY = radiusL + 50
        
        CGContextSetLineWidth(context, 0.5);   // 線の太さ
        for j in 0...12 {
            let i=j
            CGContextMoveToPoint(context,centerX + radiusS*cos(CGFloat(M_PI/6 + M_PI / 18 * Double(i))), centerY - radiusS*sin(CGFloat(M_PI/6 + M_PI / 18 * Double(i))))
            CGContextAddLineToPoint(context,centerX + radiusM*cos(CGFloat(M_PI/6 + M_PI / 18 * Double(i))), centerY - radiusM*sin(CGFloat(M_PI/6 + M_PI / 18 * Double(i))))
            CGContextStrokePath(context);  // 描画
        }
        
        CGContextSetLineWidth(context, 1.0);   // 線の太さ
        for i in 0...6 {
            CGContextMoveToPoint(context,centerX + radiusS*cos(CGFloat(M_PI/6 + M_PI / 9 * Double(i))), centerY - radiusS*sin(CGFloat(M_PI/6 + M_PI / 9 * Double(i))))
            CGContextAddLineToPoint(context,centerX + radiusL*cos(CGFloat(M_PI/6 + M_PI / 9 * Double(i))), centerY - radiusL*sin(CGFloat(M_PI/6 + M_PI / 9 * Double(i))))
            CGContextStrokePath(context);  // 描画
            
            
        }
        let graduationImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        graduationImageView.image=graduationImage
        self.view.addSubview(graduationImageView)
        
        //針を作成
        self.handImageView = UIImageView(frame: CGRectMake(0, 0, 6,radiusL*2))
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(6,radiusL*2), false, 0)//描画開始
        let path_triangle = UIBezierPath()
        path_triangle.moveToPoint(CGPointMake(2, 0))
        path_triangle.addLineToPoint(CGPointMake(0, radiusL))
        path_triangle.addLineToPoint(CGPointMake(6, radiusL))
        path_triangle.addLineToPoint(CGPointMake(4, 0))
        path_triangle.addLineToPoint(CGPointMake(2, 0))
        UIColor.redColor().setStroke()
        UIColor.redColor().setFill()
        path_triangle.stroke()
        path_triangle.fill()
        let handImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.handImageView.image=handImage
        self.handImageView.layer.position = CGPointMake(self.centerX, self.centerY)
        let angle:CGFloat = CGFloat(0.75 * M_PI * 10 / 9 - M_PI_2)
        self.handImageView.transform = CGAffineTransformMakeRotation(angle)
        self.view.addSubview(self.handImageView)
        
        self.statusLabel = UILabel(frame: CGRectMake(0,0,self.view.bounds.width/2,100))
        //self.statusLabel.backgroundColor = UIColor.grayColor()
        self.statusLabel.textAlignment = NSTextAlignment.Center
        self.statusLabel.text="Type/Token=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTRNormalized())\nType=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTYPE())\nToken=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTOKEN())"
        self.statusLabel.layer.position=CGPointMake(self.centerX, self.centerY-50)
        self.statusLabel.numberOfLines = 3
        self.view.addSubview(self.statusLabel)
        
        
        textview = UITextView(frame: CGRect(x: 0, y: self.centerY, width: self.view.bounds.width, height: 50))
        //textview.layer.position=CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height/2)
        textview.backgroundColor = UIColor.clearColor()
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
            self.statusLabel.text="Type/Token=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTRNormalized())\nType=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTYPE())\nToken=\(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTOKEN())"
            
            let angle:CGFloat = CGFloat((ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR() - 0.25) * M_PI * 10 / 9 - M_PI_2)
            UIView.animateWithDuration(1.0, animations:{() -> Void in
                self.handImageView.layer.position = CGPointMake(self.centerX, self.centerY)
                self.handImageView.transform = CGAffineTransformMakeRotation(angle)
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