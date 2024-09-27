//
//  Duplicates.swift
//  DSA
//
//  Created by Muhammad Shayan on 27/09/2024.
//

func findDuplicates(arr: [Int]) -> Bool {
    
    var set = Set<Int>()
    
    for num in arr {
        if (set.contains(num)) {
            return true
        }
        
        set.insert(num)
    }
    return false
}
