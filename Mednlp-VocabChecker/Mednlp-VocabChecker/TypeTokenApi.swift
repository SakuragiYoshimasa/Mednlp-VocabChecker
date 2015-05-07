//
//  MecabApi.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/08.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

//jaでは[TokenType, Language, Script]のみ取得可能
//enでは[TokenType,Language,Script,Lemma,LexicalClass,NameType,NameTypeOrLexicalClass]

//参考1:http://d.hatena.ne.jp/shu223/20130318/1363566717
//参考2:http://nshipster.com/nslinguistictagger/

//type,token

import Foundation


class TypeToken {

    
    static func getTypeToken(testString :String!)->[Int]{
        
        let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemesForLanguage("ja"),options: 0)
        

        var types: [String]=[""]
        var tokens:Int = 0
        let options: NSLinguisticTaggerOptions = .OmitWhitespace | .OmitPunctuation | .JoinNames
        tagger.string=testString
        tagger.enumerateTagsInRange(NSMakeRange(0, (testString as NSString).length), scheme: NSLinguisticTagSchemeTokenType, options: options) { (tag, tokenRange, sentenceRange, _) in
            let tokencell = (testString as NSString).substringWithRange(tokenRange)
            //println("\(tokencell): \(tag)")
            tokens=tokens+1
            if (!contains(types,tokencell)){
                types.append(tokencell)
            }
        }
    
        return [types.count - 1,tokens]
    
    }

    
    
    //暫定的なvocabCheck
    /* var splited = input.componentsSeparatedByString(" ")
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
    }*/
    
    //ttrInfo.SetTTR(Double(type), token: Double(splited.count))
}