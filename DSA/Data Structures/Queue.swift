//
//  Queue.swift
//  DSA
//
//  Created by Muhammad Shayyan on 24/11/2022.
//

import Foundation

public class Queue<T> where T: Equatable {
    
    private var list: [T] = []
    
    public init() {
        self.list = []
    }
    
    public init(elem: T) {
        list.append(elem)
    }
    
    public func size() -> Int {
        return list.count
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    public func dequeue() -> T {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return list.removeFirst()
    }
    
    public func enqueue(elem: T) {
        list.append(elem)
    }
    
    public func peek() -> T {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return list[.zero]
    }
    
    public func print() {
        Swift.print(list)
    }
}
