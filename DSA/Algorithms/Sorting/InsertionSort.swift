//
//  InsertionSort.swift
//  DSA
//
//  Created by Muhammad Shayyan on 27/12/2022.
//

import Foundation

func insertionSort(arr: inout [Int]) {
    // In iteration i, swap arr[i] with each larger entry to its left.
    var i = 0
    while (i < arr.count) {
        var j = i
        while (j > 0 && arr[j - 1] > arr[j]) {
            arr.swapAt(j - 1, j)
            j -= 1
        }
        i += 1
    }
}
