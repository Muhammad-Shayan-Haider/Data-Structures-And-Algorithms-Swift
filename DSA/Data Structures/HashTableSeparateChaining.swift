//
//  HashTableSeparateChaining.swift
//  DSA
//
//  Created by Muhammad Shayyan on 01/12/2022.
//

import Foundation

/*
 ref: https://www.kodeco.com/206-swift-algorithm-club-hash-tables
 */

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private(set) public var count = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key) // get value against the key.
        }
        set {
            if let value = newValue {
                update(value: value, for: key) // set the value against the key.
            } else {
                removeValue(for: key)
            }
        }
    }
    
    @discardableResult
    public mutating func removeValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        
        // 1
        if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            buckets[index].remove(at: i)
            count -= 1
            return element.value
        }
        
        // 2
        return nil
    }
    
    @discardableResult
    public mutating func update(value: Value, for key: Key) -> Value? {
        let index = self.index(for: key)
        
        /*
         You first check to see if the value is already inside a bucket. If it is, you update the value at the index i.
         */
        // 1
        if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            let oldValue = element.value
            buckets[index][i].value = value
            return oldValue
        }
        
        /*
         If execution comes to this point, it means the key doesn't map to a particular value inside the hash table. You then add the new key-value pair at the end of the bucket.
         */
        // 2
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first { $0.key == key }?.value
    }
    
    private func index(for key: Key) -> Int {
        // abs is used because hash value can be negative.
        return abs(key.hashValue) % buckets.count
    }
}
