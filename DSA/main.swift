//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var arr = [6, 5, 4, 3, 2, 1]

mergeSort(arr: &arr, left: .zero, right: arr.count - 1)

print(arr)
