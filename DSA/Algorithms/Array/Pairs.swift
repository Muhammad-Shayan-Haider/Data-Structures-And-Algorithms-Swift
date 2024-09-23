//
//  Pairs.swift
//  DSA
//
//  Created by Muhammad Shayan on 23/09/2024.
//


import Foundation

// Find all the pairs of two integers in an unsorted array that sum up to a given number.
// For example, if the array is [3, 5, 2, -4, 8, 11] and the sum is 7,
// your program should return [[11, -4], [2, 5]] because 11 + -4 = 7 and 2 + 5 = 7.

func returnPairs(arr: [Int], target: Int) -> [[Int]] {
    
    var set = Set<Int>()
    var pairs = [[Int]]()
    
    for elem in arr {
        var complement = target - elem
        if (set.contains(complement)) {
            pairs.append([complement, elem])
        } else {
            set.insert(elem)
        }
    }
    
    return pairs
}


var pairs = returnPairs(arr: [3, 5, 2, -4, 8, 11], target: 7)
