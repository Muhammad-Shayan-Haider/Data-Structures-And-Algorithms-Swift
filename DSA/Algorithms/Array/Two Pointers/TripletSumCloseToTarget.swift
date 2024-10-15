//
//  TripletSumCloseToTarget.swift
//  DSA
//
//  Created by Muhammad Shayan on 15/10/2024.
//

import Foundation

func findTripletSumCloseToTarget(arr: [Int], target: Int) -> Int {
    let arr = arr.sorted()
    var i = 0
    var smallestSum = Int.max
    var closestDistance = Int.max
    
    while (i < arr.count - 1) {
        var left = i + 1
        var right = arr.count - 1
        
        while (left < right) {
            
            let currentSum = arr[i] + arr[left] + arr[right]
            let distance = abs(currentSum - target)
            
            if (distance <= closestDistance) {
                if (distance == closestDistance) {
                    smallestSum = min(smallestSum, currentSum)
                } else {
                    smallestSum = currentSum
                }
                closestDistance = distance
            }
            if (currentSum > target) {
                right -= 1
            } else {
                left += 1
            }
        }
        
        i += 1
    }
    
    return smallestSum
}
