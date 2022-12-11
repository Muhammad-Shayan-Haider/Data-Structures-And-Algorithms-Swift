//
//  RansomNote.swift
//  DSA
//
//  Created by Muhammad Shayyan on 11/12/2022.
//

import Foundation

/**
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
  

 Constraints:

 1 <= ransomNote.length, magazine.length <= 10^5
 ransomNote and magazine consist of lowercase English letters.
 
 ref: https://leetcode.com/problems/ransom-note/description/
 */

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var ransomNoteDict: [Character: Int] = [:]
    var magazineDict: [Character: Int] = [:]
    
    // constructing dictionaries for ransomNote and magazine strings.
    for char in ransomNote {
        ransomNoteDict[char] = 0
    }
    
    for char in magazine {
        magazineDict[char] = 0
    }
    
    // counting characters of ransomNote and magazine strings in respective dictionaries.
    for char in ransomNote {
        ransomNoteDict[char]! += 1
    }
    
    for char in magazine {
        magazineDict[char]! += 1
    }
    
    for key in ransomNoteDict.keys {
        if magazineDict[key] != nil {
            if magazineDict[key]! >= ransomNoteDict[key]! {
                if let index = ransomNoteDict.index(forKey: key) {
                    ransomNoteDict.remove(at: index)
                }
            }
        }
    }
    
    return ransomNoteDict.isEmpty
}
