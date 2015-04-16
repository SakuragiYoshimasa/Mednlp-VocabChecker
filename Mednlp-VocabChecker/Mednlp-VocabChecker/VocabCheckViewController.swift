//
//  VocabCheckViewController.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import UIKit

class VocabCheckerViewController:UIViewController,UITextFieldDelegate{
    
    var textfield:UITextField!
    var movebox:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        textfield = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        textfield.backgroundColor = UIColor.redColor()
        textfield.textColor = UIColor.blackColor()
        textfield.delegate = self
        self.view.addSubview(textfield)
        
        let tapRecognazer = UITapGestureRecognizer(target: self, action: "onTap:")
        tapRecognazer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapRecognazer)
        
        ModelManager.getInstance().getVocabCheckModel().getTtrInfo().addObserver(self, forKeyPath: "ttr", options:  NSKeyValueObservingOptions.New, context: nil)
        
        movebox = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 50))
        movebox.backgroundColor = UIColor.greenColor()
        movebox.textColor = UIColor.blueColor()
        self.view.addSubview(movebox)
        
    }

    override func viewDidAppear(animated: Bool) {
        textfield.becomeFirstResponder()
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "ttr" {
            //println("change ttr")
            println(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
            
            UIView.animateWithDuration(1.0, animations:{() -> Void in
                
                self.movebox.layer.bounds.size.width = self.view.bounds.width * CGFloat(ModelManager.getInstance().getVocabCheckModel().getTtrInfo().getTTR())
                },
                completion:nil
            )
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        ModelManager.getInstance().getVocabCheckModel().VocabCheck(textField.text)
        return true
    }
    
    func onTap(recognizer:UIPanGestureRecognizer){
        textfield.resignFirstResponder()
    }
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        let resultViewController:ResultViewController = ResultViewController()
        self.presentViewController(resultViewController, animated: false, completion: nil)
        return true
    }
}