//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

let graph = ["a": ["b", "c"],
             "b": ["d"],
             "c": ["e"],
             "d": ["f"],
             "e": [],
             "f": []]

print(hasPath(graph: graph, src: "a", destination: "f"))
