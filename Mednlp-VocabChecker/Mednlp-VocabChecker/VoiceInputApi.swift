//
//  VoiceInputApi.swift
//  Mednlp-VocabChecker
//
//  Created by 櫻木善将 on 2015/04/13.
//  Copyright (c) 2015年 櫻木善将. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class VoiceInputApi:NSObject,AVAudioRecorderDelegate,AVAudioPlayerDelegate{
    
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    
    override init(){
        
        //self.audioRecorder = AVAudioRecorder()
        //self.audioPlayer = AVAudioPlayer()
        super.init()
       // self.audioRecorder.delegate = self
        
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        let soundFilePath = docsDir.stringByAppendingPathComponent("sound.caf")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        let recordSettings =
        [AVEncoderAudioQualityKey: AVAudioQuality.Min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0]
        
        var error: NSError?
        
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,
            error: &error)
        
        if let err = error {
            println("audioSession error: \(err.localizedDescription)")
        }
        
        self.audioRecorder = AVAudioRecorder(URL: soundFileURL,
            settings: recordSettings as [NSObject : AnyObject], error: &error)
        
        if let err = error {
            println("audioSession error: \(err.localizedDescription)")
        } else {
            audioRecorder.prepareToRecord()
        }
        
    }
    
    func OperateVoiceRecorder(){
        if(audioRecorder.recording){
            audioRecorder.stop()
            
            var error: NSError?
            audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder.url,error: &error)
            
            audioPlayer.delegate = self
            
            if let err = error {
                println("audioPlayer error: \(err.localizedDescription)")
            } else {
                println("Play")
                audioPlayer.play()
            }
        }else{
            if(audioPlayer != nil){
                audioPlayer.stop()
            }
            audioRecorder.record()
        }
    }
    
    func audioRecorderBeginInterruption(recorder: AVAudioRecorder!) {
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder!, error: NSError!) {
        println("Audio Play Decode Error")
    }
    
    func audioRecorderEndInterruption(recorder: AVAudioRecorder!, withOptions flags: Int) {
        
    }
}
