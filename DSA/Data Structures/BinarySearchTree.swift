//
//  BinarySearchTree.swift
//  DSA
//
//  Created by Muhammad Shayyan on 29/11/2022.
//

import Foundation

public class BinarySearchTree<T> where T: Comparable {
    
    private var nodeCount = 0
    private var root: TreeNode?
    
    public class TreeNode {
        var data: T
        var left, right: TreeNode?
        
        init(data: T, left: TreeNode? = nil, right: TreeNode? = nil) {
            self.data = data
            self.left = left
            self.right = right
        }
    }
    
    public func isEmpty() -> Bool {
        return size() == 0
    }
    
    public func size() -> Int {
        return nodeCount
    }
    
    public func add(elem: T) -> Bool {
        if contains(elem: elem) {
            return false
        } else {
            root = add(root, elem: elem)
            nodeCount += 1
            return true
        }
    }
    
    private func add(_ node: TreeNode?, elem: T) -> TreeNode? {
        var newNode: TreeNode? = node
        if node == nil { // leaf node
            newNode = TreeNode(data: elem)
        } else {
            if let data = node?.data {
                if elem < data { // check if data is smaller than current node data, add elem to left of subtree.
                    newNode?.left = add(newNode?.left, elem: elem)
                } else { // else add elem to right of current node subtree.
                    newNode?.right = add(newNode?.right, elem: elem)
                }
            }
        }
        return newNode
    }
    
    public func remove(elem: T) -> Bool {
        if contains(elem: elem) {
            root = remove(root, elem: elem)
            nodeCount -= 1
            return true
        }
        return false
    }
    
    private func remove(_ node: TreeNode?, elem: T) -> TreeNode? {
        if node == nil { // base case root is nil
            return node
        }
        var copyOfNode: TreeNode? = node
        if let node {
            if elem < node.data {
                node.left = remove(copyOfNode?.left, elem: elem)
            } else if elem > node.data {
                node.right = remove(copyOfNode?.right, elem: elem)
            } else { // The element that is to be deleted is found.
                // This is the case where left subtree is nil
                // or no subtree at all. Swap parent with right subtree root.
                if node.left == nil {
                    var rightSubtreeRoot = node.right
                    copyOfNode = nil
                    return rightSubtreeRoot
                }
                // This is the case where right subtree is nil
                // or no subtree at all. Swap parent with left subtree root.
                else if node.right == nil {
                    var leftSubtreeRoot = node.left
                    copyOfNode = nil
                    return leftSubtreeRoot
                } else {
                    // Find the left most node in right subtree.
                    var temp = digLeft(node.right)
                    // Copy data of left mode node to node.
                    node.data = temp!.data
                    // Go into the right subtree and remove the leftmost node we
                    // found and swapped data with. This prevents us from having
                    // two nodes in our tree with the same value.
                    node.right = remove(node.right, elem: temp!.data)
                }
            }
        }
        return copyOfNode
    }
    
    private func digLeft(_ node: TreeNode?) -> TreeNode? {
        var nodeCopy: TreeNode? = node
        while nodeCopy?.left != nil {
            nodeCopy = nodeCopy?.left
        }
        return nodeCopy
    }
    
    public func contains(elem: T) -> Bool {
        return contains(root, elem: elem)
    }
    
    private func contains(_ node: TreeNode?, elem: T) -> Bool {
        if node == nil { // Reached bottom, value not found.
            return false
        }
        if let node {
            if elem < node.data {
                return contains(node.left, elem: elem)
            } else if elem > node.data {
                return contains(node.right, elem: elem)
            } else {
                return true
            }
        }
        return false
    }
    
    public func height() -> Int {
        return height(root)
    }
    
    private func height(_ node: TreeNode?) -> Int {
        if let node {
            return max(height(node.left), height(node.right)) + 1
        } else {
            return 0 // base case leaf node
        }
    }
    
    public func inOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func inOrderTraversal(_ node: TreeNode?) {
        if let node {
            inOrderTraversal(node.left)
            print(node.data)
            inOrderTraversal(node.right)
        }
    }
    
    public func preOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func preOrderTraversal(_ node: TreeNode?) {
        if let node {
            print(node.data)
            inOrderTraversal(node.left)
            inOrderTraversal(node.right)
        }
    }
    
    public func postOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func postOrderTraversal(_ node: TreeNode?) {
        if let node {
            inOrderTraversal(node.left)
            inOrderTraversal(node.right)
            print(node.data)
        }
    }
    
    private func printBST(prefix: String, node: TreeNode?, isLeft: Bool) {
        if let node {
            print(prefix, terminator: "")

            isLeft ? print("├──", terminator: "") : print("└──", terminator: "")
            
            var child = ""
            if let root, node.data == root.data {
                child = ""
            } else {
                child = isLeft ? "Left " : "Right "
            }
            
            print("\(child)\(node.data)")

            printBST(prefix: prefix + (isLeft ? "│   " : "    "), node: node.left, isLeft: true)
            printBST(prefix: prefix + (isLeft ? "│   " : "    "), node: node.right, isLeft: false)
        }
    }

    public func printBST() {
        printBST(prefix: "", node: root, isLeft: false)
    }
}
