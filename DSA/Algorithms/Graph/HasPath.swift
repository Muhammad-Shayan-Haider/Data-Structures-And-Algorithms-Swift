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


func hasPathUndirected(edges: [[String]], src: String, destination: String) -> Bool {
    let graph = buildGraphFromEdges(edges: edges)
    var set = Set<String>()
    return hasPathUndirected(graph: graph, src: src, destination: destination, visited: &set)
}

func hasPathUndirected(graph: [String: [String]], src: String, destination: String, visited: inout Set<String>) -> Bool {
    if visited.contains(src) { return false }
    if src == destination {
        return true
    }
    visited.insert(src)
    
    for neighbour in graph[src]! {
        if hasPathUndirected(graph: graph, src: neighbour, destination: destination, visited: &visited) {
            return true
        }
    }
    return false
}

func buildGraphFromEdges(edges: [[String]]) -> [String: [String]] {
    var graph: [String: [String]] = [:]
    for edge in edges {
        let (a, b) = (edge[0], edge[1])
        if graph[a] == nil {
            graph[a] = []
        }
        if graph[b] == nil {
            graph[b] = []
        }
        graph[a]?.append(b)
        graph[b]?.append(a)
    }
    return graph
}
