//
//  TtrTypeTokenEntity.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation

class TtrTypeTokenEntity {

    private var ttr:Double
    private var type:Double
    private var token:Double
    
    init(){
        self.ttr = 0
        self.type = 0
        self.token = 0
    }
    
    func SetTTR(type:Double, token:Double){
        
        self.type = type
        self.token = token
        self.ttr = type/token
    
    }
    
    func getTTR() -> Double {
        
        return ttr
        
    }
    
    func getTYPE() -> Double {
        return self.type
    }
    
    func getTOKEN() -> Double {
        return self.token
    }
    
    
    
}