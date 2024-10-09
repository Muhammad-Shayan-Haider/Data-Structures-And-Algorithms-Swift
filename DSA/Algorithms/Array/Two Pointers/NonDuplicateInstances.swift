//
//  NonDuplicateInstances.swift
//  DSA
//
//  Created by Muhammad Shayan on 09/10/2024.
//

import Foundation

func findNonDuplicateInstances(A: [Int]) -> Int {
    
    var arr = A
    var i = 0
    var j = 0
    
    while (j < arr.count) {
        while (j < arr.count && arr[i] == arr[j]) {
            j += 1
        }
        i += 1
        if (j >= arr.count) { break }
        arr.swapAt(i, j)
        j += 1
    }
    var length = 0
    i = 0
    j = 1
    while (arr[i] < arr[j]) {
        length += 1
        i += 1
        j += 1
    }
    return length + 1
}
