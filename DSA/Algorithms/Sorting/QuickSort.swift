//
//  QuickSort.swift
//  DSA
//
//  Created by Muhammad Shayyan on 13/01/2023.
//

import Foundation

func partition(arr: inout [Int], lo: Int, hi: Int) -> Int {
    var i = lo + 1
    var j = hi
    
    while (true) {
        
        // Scan i from left to right so long as (a[i] < a[lo]).
        while (arr[i] < arr[lo]) {
            i += 1
            if (i >= hi) {
                break;
            }
        }
        
        // Scan j from right to left so long as (a[j] > a[lo]).
        while (arr[j] > arr[lo]) {
            j -= 1
            if (j <= lo) {
                break;
            }
        }
        
        // When pointers cross.
        // Exchange a[lo] with a[j].
        if (j <= i) {
            break;
        }
    
        // Exchange a[i] with a[j].
        arr.swapAt(i, j)
    }
    
    arr.swapAt(lo, j)
    return j // in place (sorted) item.
}

func sort(arr: inout [Int], lo: Int, hi: Int) {
    if (hi <= lo) {
        return
    }
    
    let j = partition(arr: &arr, lo: lo, hi: hi) // get the index of sorted item i.e. pivot.
    sort(arr: &arr, lo: lo, hi: j - 1) // recursively sort the elements less than the pivot.
    sort(arr: &arr, lo: j + 1, hi: hi) // recursively sort the elements greater than the pivot.
}

func quickSort(arr: inout [Int]) {
    arr.shuffle()
    sort(arr: &arr, lo: 0, hi: arr.count - 1)
}
