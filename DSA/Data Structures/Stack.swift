//
//  Stack.swift
//  DSA
//
//  Created by Muhammad Shayyan on 24/11/2022.
//

import Foundation

public class Stack<T> where T: Equatable {
    private var list: [T] = []
    
    public init() {
        list = []
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
    
    public func push(elem: T) {
        list.append(elem)
    }
    
    public func pop() -> T {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return list.removeLast()
    }
    
    public func peek() -> T {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return list[list.count - 1]
    }
    
    public func print() {
        Swift.print(list)
    }
}
