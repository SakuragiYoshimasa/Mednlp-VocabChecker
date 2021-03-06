//
//  TtrTypeTokenEntity.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation

class TtrTypeTokenEntity :NSObject{

    private dynamic var ttr:Double
    private var type:Double
    private var token:Double
    
    
    override init(){
        self.ttr = 1.0
        self.type = 0
        self.token = 0
    }
    
    func SetTTR(type:Double, token:Double){
        
        self.type = type
        self.token = token
        if token==0 {
            self.ttr=1.0
        }else{
            self.ttr = type/token
        }
    
    }
    
    func getTTRResult() -> String {
        if ttr > 0.9 {
            return "素晴らしい語彙力です"
        }else if ttr > 0.6 {
            return "平均的です"
        }else{
            return "語彙不足の傾向があります"
        }
    }
    
    func getTTR() -> Double {
        
        return ttr
        
    }
    func getTTRNormalized() -> NSString {
        
        return NSString(format: "%.2f", ttr)
        
    }
    
    func getTYPE() -> Double {
        return self.type
    }
    
    func getTOKEN() -> Double {
        return self.token
    }    
}