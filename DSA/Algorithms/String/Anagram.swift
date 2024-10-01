//
//  Anagram.swift
//  DSA
//
//  Created by Muhammad Shayan on 01/10/2024.
//

import Foundation


/*
 Problem Statement
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:

 Input: s = "listen", t = "silent"
 Output: true
 Example 2:

 Input: s = "rat", t = "car"
 Output: false
 Example 3:

 Input: s = "hello", t = "world"
 Output: false
 */

func isAnagram(str1: String, str2: String) -> Bool{
    if (str1.count != str2.count) { return false }
    
    var dict1: [Character: Int] = [:]
    var dict2: [Character: Int] = [:]
    
    for character in str1 {
        if dict1[character] != nil {
            dict1[character]! += 1
        } else {
            dict1[character] = 1
        }
    }
    
    for character in str2 {
        if dict2[character] != nil {
            dict2[character]! += 1
        } else {
            dict2[character] = 1
        }
    }
    
    return dict1 == dict2
}
