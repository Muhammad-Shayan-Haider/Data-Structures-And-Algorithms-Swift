//
//  ShortestWordDistance.swift
//  DSA
//
//  Created by Muhammad Shayan on 01/10/2024.
//

import Foundation


/*
 Given an array of strings words and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

 Example 1:

 Input: words = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"], word1 = "fox", word2 = "dog"
 Output: 5
 Explanation: The distance between "fox" and "dog" is 5 words.
 Example 2:

 Input: words = ["a", "c", "d", "b", "a"], word1 = "a", word2 = "b"
 Output: 1
 Explanation: The shortest distance between "a" and "b" is 1 word. Please note that "a" appeared twice.
 Example 3:

 Input: words = ["a", "b", "c", "d", "e"], word1 = "a", word2 = "e"
 Output: 4
 Explanation: The distance between "a" and "e" is 4 words.
 */

func findMinimunDistanceIn(word1: String, word2: String, words: [String]) -> Int {
    
    var minDistance = words.count
    
    var i = 0, j = 0, currentWordOneIndex = 0;
    while (i < words.count && j < words.count) {
        
        while (word1 != words[i]) {
            i += 1
        }
        currentWordOneIndex = i
        i += 1
        while (word2 != words[j]) {
            j += 1
        }
        var distance = abs(currentWordOneIndex - j)
        if (minDistance > distance) {
            minDistance = distance
        }
        while (i < words.count) {
            if (word1 == words[i]) {
                distance = abs(i - j)
                if (minDistance > distance) {
                    minDistance = distance
                }
            }
            i += 1
        }
        while (j < words.count) {
            if (word2 == words[j]) {
                distance = abs(currentWordOneIndex - j)
                if (minDistance > distance) {
                    minDistance = distance
                }
            }
            j += 1
            
        }
    }
    return minDistance
}
