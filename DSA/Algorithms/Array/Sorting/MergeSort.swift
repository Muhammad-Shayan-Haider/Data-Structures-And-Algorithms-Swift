//
//  MergeSort.swift
//  DSA
//
//  Created by Muhammad Shayyan on 03/12/2022.
//

import Foundation

func mergeSort(arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let mid = (left + right) / 2
        
        mergeSort(arr: &arr, left: left, right: mid)
        mergeSort(arr: &arr, left: mid + 1, right: right)
        merge(arr: &arr, left: left, mid: mid, right: right)
    }
    
    func merge(arr: inout [Int], left: Int, mid: Int, right: Int) {
        // Build temp array
        var tempArr = Array.init(repeating: 0, count: right - left + 1)
        var i = left
        var j = mid + 1
        var k = 0
        
        // Both sub-arrays have sorted values, and then try and merge these in sorted order.
        while (i <= mid && j <= right) {
            if arr[i] < arr[j] {
                tempArr[k] = arr[i]
                i += 1
                k += 1
            } else {
                tempArr[k] = arr[j]
                j += 1
                k += 1
            }
        }
        
        // Add rest of the values from left sub-array.
        while i <= mid {
            tempArr[k] = arr[i]
            k += 1
            i += 1
        }
        
        // Add rest of the values from right sub-array.
        while j <= right {
            tempArr[k] = arr[j]
            k += 1
            j += 1
        }
        
        var a = left
        while (a <= right) {
            arr[a] = tempArr[a - left]
            a += 1
        }
    }
}
