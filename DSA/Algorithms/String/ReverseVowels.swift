//
//  ReverseVowels.swift
//  DSA
//
//  Created by Muhammad Shayan on 30/09/2024.
//

/*
 Reverse Vowels (easy)
 Problem Statement
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 Example 1:

 Input: s= "hello"
 Output: "holle"
 Example 2:

 Input: s= "AEIOU"
 Output: "UOIEA"
 Example 3:

 Input: s= "DesignGUrus"
 Output: "DusUgnGires"

 */
import Foundation

func reverseVowels(str: String) -> String {
    
    let vowels = Set("aeiouAEIOU")
    var newStr = Array(str)
    var left = 0
    var right = str.count - 1
    
    while (left < right) {
        while (left < right && !vowels.contains(newStr[left])) {
            left += 1
        }
        while (left < right && !vowels.contains(newStr[right])) {
            right -= 1
        }
        newStr.swapAt(left, right)
        right -= 1
        left += 1
    }
    
    return String(newStr)
}
