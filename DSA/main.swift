//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var queue = Queue<Int>()

queue.enqueue(elem: 10)
queue.enqueue(elem: 9)
queue.enqueue(elem: 8)
queue.enqueue(elem: 7)
queue.enqueue(elem: 6)

print(queue.peek())

print(queue.dequeue())

queue.print()

print(queue.dequeue())

queue.print()

