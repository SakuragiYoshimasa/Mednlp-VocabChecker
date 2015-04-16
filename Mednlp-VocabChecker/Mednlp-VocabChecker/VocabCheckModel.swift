//
//  VocabCheckModel.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation


class VocabCheckModel:NSObject{
    
    private dynamic var ttrInfo:TtrTypeTokenEntity
    
    override init(){
        ttrInfo = TtrTypeTokenEntity()
    }
    
    func initTtrInfo(){
        ttrInfo = TtrTypeTokenEntity()
    }
    
    func getTtrInfo()->TtrTypeTokenEntity{
        return ttrInfo
    }
    
    func VocabCheck(input:String){
        println(input)
        
        
        //暫定的なvocabCheck
        var splited = input.componentsSeparatedByString(" ")
        println(String(splited.count))
        var type = 0
        var flag = 0
        for i in 0..<splited.count {
            
            flag = 0
            
            for j in (i+1)..<splited.count {
                if(splited[i] == splited[j]){
                    flag++
                    break
                }
            }
            if(flag == 0){
                type++
            }
        }
        
        ttrInfo.SetTTR(Double(type), token: Double(splited.count))
    }

}