//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var stack = Stack<Int>()

stack.push(elem: 10)
stack.push(elem: 9)
stack.push(elem: 8)
stack.push(elem: 7)
stack.push(elem: 6)

print(stack.peek())

stack.pop()

stack.print()

