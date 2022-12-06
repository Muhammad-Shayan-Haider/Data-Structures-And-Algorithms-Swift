//
//  HasPath.swift
//  DSA
//
//  Created by Muhammad Shayyan on 06/12/2022.
//

import Foundation


/// Checks if path exists between source and destination in an acyclic directed graph using dfs.
/// - Parameters:
///   - graph: Dictionary of adjacency list.
///   - src: Source node.
///   - destination: Destination node.
/// - Returns: Returns true if paths exists between source and destination else returns false.
func hasPath(graph: [String: [String]], src: String, destination: String) -> Bool {
    if src == destination {
        return true
    }
    
    for neighbour in graph[src]! {
        if hasPath(graph: graph, src: neighbour, destination: destination) {
            return true
        }
    }
    return false
}
