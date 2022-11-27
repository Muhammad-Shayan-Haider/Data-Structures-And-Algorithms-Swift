//
//  FindGroups (Islands).swift
//  DSA
//
//  Created by Muhammad Shayyan on 21/11/2022.
//

import Foundation

/*
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 let arr = [ [1, 1, 0, 0, 0],
             [1, 1, 0, 0, 0],
             [0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0],
             [1, 1, 0, 0, 1]] There are 3 groups
 
 ref: https://leetcode.com/problems/number-of-islands/
 */

class NoOfGroupsFinder {
    
    func findGroups(arr: inout [[Int]]) -> Int {
        var numberOfGroups = 0
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                // count number of groups
                numberOfGroups += traverseGraph(arr: &arr, row: i, col: j)
            }
        }
            
        return numberOfGroups
    }

    func traverseGraph(arr: inout [[Int]], row: Int, col: Int) -> Int {
        if row >= arr.count {
            return 0
        }
        if row < 0 || col < 0 {
            return 0
        }
        if col >= arr[row].count {
            return 0
        }
        if arr[row][col] == 0 {
            return 0
        }
        
        arr[row][col] = 0

        // Verticals and Horizontals
        traverseGraph(arr: &arr, row: row + 1, col: col)
        traverseGraph(arr: &arr, row: row - 1, col: col)
        traverseGraph(arr: &arr, row: row, col: col - 1)
        traverseGraph(arr: &arr, row: row, col: col + 1)
        
        // Diagonals
        traverseGraph(arr: &arr, row: row + 1, col: col + 1)
        traverseGraph(arr: &arr, row: row - 1, col: col - 1)
        traverseGraph(arr: &arr, row: row + 1, col: col - 1)
        traverseGraph(arr: &arr, row: row - 1, col: col + 1)
        
        return 1
    }
}
