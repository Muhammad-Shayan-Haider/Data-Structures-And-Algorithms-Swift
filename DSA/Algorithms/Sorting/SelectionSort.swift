//
//  SelectionSort.swift
//  DSA
//
//  Created by Muhammad Shayyan on 27/12/2022.
//

import Foundation

func selectionSort(arr: inout [Int]) {
    // In iteration i, find index min of smallest remaining entry.
    // Swap arr[i] and arr[min].
    var i = 0
    while (i < arr.count) {
        var min = i
        var j = i + 1
        while (j < arr.count) {
            if (arr[j] < arr[min]) {
                min = j
            }
            j += 1
        }
        arr.swapAt(min, i)
        i += 1
    }
}
