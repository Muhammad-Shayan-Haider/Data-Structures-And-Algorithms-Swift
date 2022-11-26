//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var pq = PriorityQueue<Int>(elems: [6, 5, 4, 3, 2, 1])

pq.heapType = .min

pq.print()

print(pq.size())

pq.poll()

pq.print()
