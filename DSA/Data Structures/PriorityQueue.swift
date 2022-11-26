//
//  PriorityQueue.swift
//  DSA
//
//  Created by Muhammad Shayyan on 24/11/2022.
//

import Foundation

public typealias ComparableHashableEquatable = Equatable & Hashable & Comparable

public class PriorityQueue<T> where T: ComparableHashableEquatable {
    
    enum HeapType {
        case min
        case max
        
        func compare(_ lhs: T, _ rhs: T) -> Bool {
            switch self {
            case .min:
                return lhs <= rhs
            case .max:
                return lhs >= rhs
            }
        }
    }
    
    private var heap = [T]()
    var heapType: HeapType = .min
    
    public init() {
        heap = []
    }
    
    public init(elems: [T]) {
        // Build heap
        for elem in elems {
            heap.append(elem)
        }
        var i = max(0, (heap.count / 2) - 1)
        while i >= 0 {
            bubbleDown(at: i)
            i -= 1
        }
    }
    
    public func clear() {
        heap = []
    }
    
    public func size() -> Int {
        return heap.count
    }
    
    public func peek() -> T {
        return heap[0]
    }
    
    public func poll() {
        remove(at: 0)
    }
    
    public func remove(at index: Int) {
        heap.swapAt(index, heap.count - 1)
        heap.removeLast()
        
        bubbleDown(at: index)
        bubbleUp(at: index)
    }
    
    public func add(elem: T) {
        heap.append(elem)
        bubbleUp(at: heap.count - 1)
    }
    
    // Heapify
    private func bubbleDown(at i : Int) {
        let index = i
        let leftChildIndex = leftOf(index)
        let rightChildIndex = rightOf(index)
        
        var max = index
        if leftChildIndex < heap.count && heapType.compare(heap[leftChildIndex], heap[max]) {
            max = leftChildIndex
        }
        
        if rightChildIndex < heap.count && heapType.compare(heap[rightChildIndex], heap[max]) {
            max = rightChildIndex
        }
        
        if max != index {
            heap.swapAt(index, max)
            bubbleDown(at: max)
        }
    }
    
    private func bubbleUp(at index: Int) {
        guard index > 0 else { return }
        let parent = parentOf(index)
        if heapType.compare(heap[parent], heap[index]) {
            heap.swapAt(parent, index)
            bubbleUp(at: parent)
        }
    }
    
    public func contains(elem: T) -> Bool {
        return heap.contains(elem)
    }
    
    public func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    private func leftOf(_ i: Int) -> Int {
        return 2 * i
    }
    
    private func rightOf(_ i: Int) -> Int {
        return leftOf(i) + 1
    }
    
    private func parentOf(_ i: Int) -> Int {
        return (i - 1) / 2
    }
    
    public func print() {
        var level = 0
        var numOfElemsAtLevel = 1
        var numPrinted = 0
        for elem in heap {
            if numPrinted == 0 {
                Swift.print("\nLevel # \(level):", terminator: " ")
            }
            Swift.print(elem, terminator: " ")
            numPrinted += 1
            if numPrinted == numOfElemsAtLevel {
                level += 1
                numOfElemsAtLevel *= 2
                numPrinted = 0
            }
        }
        Swift.print("")
    }
    
}
