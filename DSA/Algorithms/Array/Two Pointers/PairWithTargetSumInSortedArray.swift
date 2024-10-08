//
//  PairWithTargetSumInSortedArray.swift
//  DSA
//
//  Created by Muhammad Shayan on 08/10/2024.
//

import Foundation


func findPair(for target: Int, in sortedArr: [Int]) -> (Int, Int) {
    
    var i = 0
    var j = sortedArr.count - 1
    
    while (i < j) {
        if (sortedArr[i] + sortedArr[j] == target) {
            return (i, j)
        } else if (sortedArr[i] + sortedArr[j] > target) {
            j -= 1
        } else {
            i += 1
        }
    }
    
    return (-1, -1)
}
