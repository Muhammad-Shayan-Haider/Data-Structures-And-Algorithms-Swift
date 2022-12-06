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

let edges = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["o", "n"]
]
print(hasPathUndirected(edges: edges, src: "l", destination: "j"))
