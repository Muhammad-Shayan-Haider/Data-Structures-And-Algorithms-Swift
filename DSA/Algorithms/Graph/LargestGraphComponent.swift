//
//  LargestGraphComponent.swift
//  DSA
//
//  Created by Muhammad Shayyan on 06/12/2022.
//

import Foundation

func findlargestComponentCount(graph: [String: [String]]) {
    var visited = Set<String>()
    var maxSize = 0
    
    for key in graph.keys {
        let size = exploreSize(graph: graph, node: key, visited: &visited)
        if size > maxSize {
            maxSize = size
        }
    }
}

func exploreSize(graph: [String: [String]], node: String, visited: inout Set<String>) -> Int {
    if visited.contains(node) {
        return 0
    }
    visited.insert(node)
    var size = 1
    
    for neighbour in graph[node]! {
        size += exploreSize(graph: graph, node: neighbour, visited: &visited)
    }
    return size
}
