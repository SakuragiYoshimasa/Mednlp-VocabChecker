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
    
        var typetoken:[Int] = TypeToken.getTypeToken(input);

        ttrInfo.SetTTR(Double(typetoken[0]), token: Double(typetoken[1]))
    }

}