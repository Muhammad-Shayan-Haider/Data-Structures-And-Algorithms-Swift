//
//  TripletSumToZero.swift
//  DSA
//
//  Created by Muhammad Shayan on 11/10/2024.
//

import Foundation

func findTripletSumToZero(arr: [Int]) -> [[Int]] {
    
    let arr = arr.sorted() // to avoid duplicates
    var triplets = [[Int]]()
    
    var i = 0
    while (i < arr.count - 1) {
        var left = i + 1
        var right = arr.count - 1
        
        if (i > 0 && arr[i] == arr[left]) {
            i += 1
            continue
        }
        
        while (left < right) {
            let targetSum = -arr[i]
            let currentSum = arr[left] + arr[right]
            
            if (targetSum == currentSum) {
                triplets.append([arr[i], arr[left], arr[right]])
                while (left < right && arr[left] == arr[left + 1]) {
                    left += 1
                }
                while (left > right && arr[right] == arr[right - 1]) {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if (currentSum < targetSum) {
                left += 1
            } else {
                right -= 1
            }
        }
        i += 1
    }
    return triplets
}
