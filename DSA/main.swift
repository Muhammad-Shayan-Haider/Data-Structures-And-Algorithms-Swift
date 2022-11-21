//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var doublyLinkedList = DoublyLinkedList<Int>()

doublyLinkedList.add(elem: 1)
doublyLinkedList.add(elem: 2)
doublyLinkedList.add(elem: 3)
doublyLinkedList.add(elem: 4)

doublyLinkedList.addFirst(elem: 0)
doublyLinkedList.addFirst(elem: 9)
doublyLinkedList.addLast(elem: 10)

doublyLinkedList.print()
print("Index of 4 = \(doublyLinkedList.index(of: 4))")

print("Size = \(doublyLinkedList.getSize())")

doublyLinkedList.clear()

doublyLinkedList.addFirst(elem: 0)
doublyLinkedList.addFirst(elem: 9)
doublyLinkedList.addLast(elem: 10)
doublyLinkedList.print()
print("Size = \(doublyLinkedList.getSize())")
doublyLinkedList.removeFirst()
doublyLinkedList.print()
print("Size = \(doublyLinkedList.getSize())")
doublyLinkedList.addFirst(elem: 8)
doublyLinkedList.print()
print("Size = \(doublyLinkedList.getSize())")

doublyLinkedList.print()
doublyLinkedList.remove(at: 1)
doublyLinkedList.print()

print(doublyLinkedList.remove(elem: 8))
print(doublyLinkedList.remove(elem: 0))
doublyLinkedList.print()
print(doublyLinkedList.contains(elem: 10))
print(doublyLinkedList.contains(elem: 0))

