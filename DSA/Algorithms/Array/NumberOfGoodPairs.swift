//
//  NumberOfGoodPairs.swift
//  DSA
//
//  Created by Muhammad Shayan on 03/10/2024.
//

import Foundation

func findNumberOfGoodPairs(arr: [Int]) -> Int {
    
    var count = [Int: Int]()
    var result = 0
    
    for num in arr {
        result += count[num, default: 0]
        count[num, default: 0] += 1
    }
    
    return result
}
