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

    
    static func setString(testString :String!)->[Int]{
        
        
        let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemesForLanguage("ja"),options: 0)
        
        //var token: Int!
        //var type: Int!
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
        //token=types.count
        //token=tokens
    
        return [types.count,tokens]
    
    }
   /* func getType()->Int{
        return self.type
    }
    func getToken()->Int{
        return self.token
    }*/
}