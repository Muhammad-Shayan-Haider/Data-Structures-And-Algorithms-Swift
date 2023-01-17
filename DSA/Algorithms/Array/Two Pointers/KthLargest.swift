//
//  KthLargest.swift
//  DSA
//
//  Created by Muhammad Shayyan on 17/01/2023.
//

import Foundation

func findKthLargest(array: [Int], k: Int) -> Int {
    var arr = array
    arr.shuffle()
    var lo = 0
    var hi = arr.count - 1
    
    while (lo < hi) {
        let pivot = partition(arr: &arr, lo: lo, hi: hi) // Partition makes the first element in place, and returns the index of the in place (sorted) element.
        if (pivot < k) { // If the index of the element found in place is less than k, then we need to find the kth largest element in right partition.
            lo = pivot + 1
        } else if (pivot > k) { // If the index of the element found in place is greater than k, then we need to find the kth largest element in left partition.
            hi = pivot - 1
        } else { // else if pivot == k, then kth largest element is found.
            return arr[k]
        }
    }
    
    return arr[k]
}
