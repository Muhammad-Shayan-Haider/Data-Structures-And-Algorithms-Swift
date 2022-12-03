//
//  PalindromeRecursive.swift
//  DSA
//
//  Created by Muhammad Shayyan on 03/12/2022.
//

import Foundation


func isPalindrome(str: String) -> Bool {
    // Base case: Empty string or single letter is palindrome.
    if str.count == .zero || str.count == 1 {
        return true
    }
    
    if str[.zero] == str[str.count - 1] {
        // recursive case
        return isPalindrome(str: str[1...str.count - 2])
    }
    
    return false
}

extension String {
    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start ..< end])
    }
    
    subscript (r: CountableClosedRange<Int>) -> String {
        let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[startIndex...endIndex])
    }
}
