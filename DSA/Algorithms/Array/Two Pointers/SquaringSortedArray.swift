//
//  SquaringSortedArray.swift
//  DSA
//
//  Created by Muhammad Shayan on 10/10/2024.
//

import Foundation

func squareSortedArray(arr: [Int]) -> [Int] {
    
    var newArr = [Int]()
    var j = 0
    while (j < arr.count && arr[j] < 0) {
        j += 1
    }
    var i = j - 1
    while (j < arr.count) {
        
        while (i >= 0 && abs(arr[i]) <= arr[j]) {
            newArr.append(arr[i] * arr[i])
            i -= 1
        }
        newArr.append(arr[j] * arr[j])
        j += 1
        
    }
    if (j < arr.count) {
        while (j < arr.count) {
            newArr.append(arr[j] * arr[j])
            j += 1
        }
    }
    if (i >= 0) {
        while (i >= 0) {
            newArr.append(arr[i] * arr[i])
            i -= 1
        }
    }
    
    return newArr
}
