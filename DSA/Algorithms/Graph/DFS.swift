//
//  DFS.swift
//  DSA
//
//  Created by Muhammad Shayyan on 04/12/2022.
//

import Foundation

// DFS for acyclic graph.
func depthFirstSearchIterative(graph: [String: [String]], source: String) {
    var stack = Stack<String>()
    stack.push(elem: source)
    
    while(!stack.isEmpty()) {
        let current = stack.pop()
        print(current)
        
        for neighbour in graph[current]! {
            stack.push(elem: neighbour)
        }
    }
}

// DFS for acyclic graph.
func depthFirstSearchRecursive(graph: [String: [String]], source: String) {
    print(source)
    
    for neighbour in graph[source]! {
        depthFirstSearchRecursive(graph: graph, source: neighbour)
    }
}
