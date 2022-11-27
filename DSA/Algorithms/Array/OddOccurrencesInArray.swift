//
//  OddOccurrencesInArray.swift
//  DSA
//
//  Created by Muhammad Shayyan on 27/11/2022.
//

import Foundation

/*
 A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.

 For example, in array A such that:

   A[0] = 9  A[1] = 3  A[2] = 9
   A[3] = 3  A[4] = 9  A[5] = 7
   A[6] = 9
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.

 For example, given array A such that:

   A[0] = 9  A[1] = 3  A[2] = 9
   A[3] = 3  A[4] = 9  A[5] = 7
   A[6] = 9
 the function should return 7, as explained in the example above.

 Write an efficient algorithm for the following assumptions:

 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.

 ref: https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
 */

public func findOddOccurrence(_ A : inout [Int]) -> Int {
    if A.isEmpty {
        return 0
    }

    var dict: [Int: Int] = [:]
    dict[A[0]] = A[0]
    for i in 1..<A.count {
        if let _ = dict[A[i]] {
            dict.removeValue(forKey: A[i])
        } else {
            dict[A[i]] = A[i]
        }
    }

    if dict.isEmpty {
        return 0
    }
    let nums = dict.map { $0.1 }
    return nums[0]
}
