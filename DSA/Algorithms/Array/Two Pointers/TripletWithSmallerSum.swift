//
//  TripletWithSmallerSum.swift
//  DSA
//
//  Created by Muhammad Shayan on 16/10/2024.
//

import Foundation

func findTripletsWithSmallerSum(arr: [Int], target: Int) -> Int {
    let arr = arr.sorted()
    var i = 0
    var countOfSmallerSumTriplets = 0
    
    while (i < arr.count - 1) {
        var left = i + 1
        var right = arr.count - 1
        
        let complement = target - arr[i]
        while (left < right) {
            let leftAndRightSum = arr[left] + arr[right]
            
            if (leftAndRightSum < complement) {
                countOfSmallerSumTriplets += right - left // main logic (because elem at right till left satisfy the condition,
                left += 1                                 // as the array is sorted.
            } else {
                right -= 1
            }
        }
        i += 1
    }
    return countOfSmallerSumTriplets
}
