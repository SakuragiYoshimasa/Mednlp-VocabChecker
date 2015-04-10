//
//  ModelManager.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation

final class ModelManager{
    
    //singleton
    private static let modelManager = ModelManager()
    private init(){}
    static func getInstance() -> ModelManager {
        return modelManager
    }
    
    private let sendDataModel = SendDataModel();
    func getSendDataModel() -> SendDataModel{
        return sendDataModel
    }
    
    private let vocabCheckModel = VocabCheckModel();
    func getVocabCheckModel() -> VocabCheckModel {
        return vocabCheckModel
    }
    
}