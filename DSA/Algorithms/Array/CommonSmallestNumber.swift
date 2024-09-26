//
//  CommonSmallestNumber.swift
//  DSA
//
//  Created by Muhammad Shayan on 26/09/2024.
//

import Foundation

func findCommonSmallestInSortedArrays(arr1: [Int], arr2: [Int], arr3: [Int]) -> Int {
    var i = 0
    var j = 0
    var k = 0
    var maximum = Int.min
    
    while(true) {
        
        if (arr1[i] == arr2[j] && arr2[j] == arr3[k]) {
            return arr1[i]
        }
        
        if (arr1[i] <= arr2[j] && arr1[i] <= arr3[k]) {
            maximum = max(arr2[j], arr3[k])
            while (i < arr1.count && arr1[i] < maximum) { i += 1 }
        }
        
        if (i >= arr1.count) {
            break
        }
        
        if (arr2[j] <= arr1[i] && arr2[j] <= arr3[k]) {
            maximum = max(arr1[i], arr3[k])
            while (j < arr2.count && arr2[j] < maximum) { j += 1 }
        }
        
        if (j >= arr2.count) {
            break
        }
        
        if (arr3[k] <= arr1[i] && arr3[k] <= arr2[j]) {
            maximum = max(arr1[i], arr2[j])
            while (k < arr3.count && arr3[k] < maximum) { k += 1 }
        }
        
        if (k >= arr3.count) {
            break
        }
        
    }
    
    return -1
}


