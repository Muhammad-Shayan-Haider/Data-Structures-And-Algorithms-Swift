//
//  BFS.swift
//  DSA
//
//  Created by Muhammad Shayyan on 04/12/2022.
//

import Foundation

// BFS without cycles in graph.
func breadtgFirstSearchIterative(graph: [String: [String]], source: String) {
    var queue = Queue<String>()
    queue.enqueue(elem: source)
    
    while(!queue.isEmpty()) {
        let current = queue.dequeue()
        print(current)
        
        for neighbour in graph[current]! {
            queue.enqueue(elem: neighbour)
        }
    }
}
