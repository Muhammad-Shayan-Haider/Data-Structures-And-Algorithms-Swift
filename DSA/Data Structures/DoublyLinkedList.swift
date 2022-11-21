//
//  SinglyLinkedList.swift
//  DSA
//
//  Created by Muhammad Shayyan on 19/11/2022.
//

import Foundation

public class DoublyLinkedList<T> where T: Equatable {
    
    public class Node<T> where T: Equatable {
        var data: T
        var next, previous: Node<T>?
        
        init(data: T, next: Node<T>? = nil, previous: Node<T>? = nil) {
            self.data = data
            self.next = next
            self.previous = previous
        }
    }
    
    private var size = 0
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public func clear() {
        var temp: Node<T>? = head
        while temp != nil {
            let next: Node<T>? = temp?.next
            temp?.previous = nil
            temp?.next = nil
            temp = next
        }
        temp = nil
        head = nil
        tail = nil
        size = 0
    }
    
    public func getSize() -> Int {
        return size
    }
    
    public func isEmpty() -> Bool {
        return getSize() == .zero
    }
    
    public func add(elem: T) {
        addLast(elem: elem)
    }
    
    public func addFirst(elem: T) {
        let newElem: Node<T>? = Node(data: elem)
        if isEmpty() {
            head = newElem
            head?.previous = nil
            head?.next = nil
            tail = head
            size = 1
        } else {
            newElem?.next = head
            head?.previous = newElem
            head = newElem
            head?.previous = nil
            size += 1
        }
    }
    
    public func addLast(elem: T) {
        let newElem: Node<T>? = Node(data: elem)
        if (isEmpty()) {
            head = newElem
            head?.previous = nil
            head?.next = nil
            tail = head
            size = 1
        } else {
            let temp = tail
            temp?.next = newElem
            newElem?.previous = temp
            newElem?.next = nil
            tail = newElem
            size += 1
        }
    }
    
    public func peekFirst() -> T {
        if isEmpty() {
            fatalError("Empty list")
        }
        return head!.data
    }
    
    public func peekLast() -> T {
        if isEmpty() {
            fatalError("Empty list")
        }
        return tail!.data
    }
    
    public func removeFirst() {
        if isEmpty() {
            tail = nil
            fatalError("Empty list")
        } else {
            head = head?.next
            head?.previous = nil
            size -= 1
        }
    }
    
    public func removeLast() {
        if isEmpty() {
            head = nil
            fatalError("Empty list")
        } else {
            tail = tail?.previous
            tail?.next = nil
            size -= 1
        }
    }
    
    public func remove(node: Node<T>?) {
        if node?.previous == nil {
            removeFirst()
            return
        }
        if node?.next == nil {
            removeLast()
            return
        }
        
        var temp = node
        temp?.next?.previous = temp?.previous
        temp?.previous?.next = temp?.next
        temp = nil
        temp?.next = nil
        temp?.previous = nil
        size -= 1
    }
    
    public func remove(at index: Int) {
        if index < 0 || index >= size {
            fatalError("Index out of bounds")
        } else {
            var temp: Node<T>?
            var i = 0
            if index < (size / 2) {
                temp = head
                while (i != index) {
                    temp = temp?.next
                    i += 1
                }
            } else {
                i = size - 1
                temp = tail
                while (i != index && temp != nil) {
                    temp = temp?.previous
                    i -= 1
                }
            }
            remove(node: temp)
        }
    }
    
    public func remove(elem: T) -> Bool {
        if isEmpty() {
            fatalError("empty list")
        } else {
            var temp = head
            while (temp != nil) {
                if temp!.data == elem {
                    remove(node: temp)
                    return true
                }
                temp = temp?.next
            }
        }
        return false
    }
    
    public func index(of elem: T) -> Int {
        var index = 0
        var temp = head
        while (temp != nil) {
            if temp!.data == elem {
                return index
            }
            index += 1
            temp = temp?.next
        }
        return -1
    }
    
    public func contains(elem: T) -> Bool {
        return index(of: elem) != -1
    }
    
    public func print() {
        var temp = head
        var tempArr = [T]()
        while temp != nil {
            tempArr.append(temp!.data)
            temp = temp?.next
        }
        Swift.print(tempArr)
    }
}
