//
//  Sqrt.swift
//  DSA
//
//  Created by Muhammad Shayan on 04/10/2024.
//

import Foundation

func sqrt(n: Int) -> Int {
    if (n == 1) {
        return 1
    }
    let squareRoot: Int = 0
    var left = 0
    var right = n
    while (left <= right) {
        let mid = (left + right) / 2
        if (mid * mid == n || ((mid + 1) * (mid + 1) > n && (mid * mid) < n)) {
            return mid
        } else if (mid * mid < n) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return right
}
 

