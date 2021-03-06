//
//  user.swift
//  Jotto
//
//  Created by Ashwin Vivek on 12/24/16.
//  Copyright © 2016 AshwinVivek. All rights reserved.
//

import Foundation
import Firebase

class userObject: NSObject {
    
    let key: String
    let name: String
    let word: String
    let wordToGuess: String
    var someoneSetMyValue: Bool
    
    let kword = "word"
    let kname = "name"
    let kSomeoneSetMyValue = "someoneSetMyValue"
    let kguess = "wordToGuess"
    
    init (key: String, name: String, word: String, someoneSetMyValue: Bool, wordToGuess: String)
    {
        self.key = key
        self.name = name
        self.word = word
        self.someoneSetMyValue = someoneSetMyValue
        self.wordToGuess = wordToGuess
    }
    
    init(snapshot: FIRDataSnapshot)
    {
        self.key = snapshot.key
        self.name = (snapshot.value as! NSDictionary)[self.kname] as! String
        self.word = (snapshot.value as! NSDictionary)[self.kword] as! String
        self.someoneSetMyValue = (snapshot.value as! NSDictionary)[self.kSomeoneSetMyValue] as! Bool
        self.wordToGuess = (snapshot.value as! NSDictionary)[self.kguess] as! String
    }
    
    func getSnapshotValue() -> NSDictionary {
        return ["name": name, "word": word, "someoneSetMyValue": someoneSetMyValue, "wordToGuess": wordToGuess]
    }
    
    func hasBeenChosen() -> Bool {
        
        if (self.wordToGuess != ""){
            return true
        }
        return false
        
    }
    
}
