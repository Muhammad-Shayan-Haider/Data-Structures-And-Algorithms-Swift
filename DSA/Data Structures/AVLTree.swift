//
//  AVLTree.swift
//  DSA
//
//  Created by Muhammad Shayyan on 03/12/2022.
//

import Foundation

public class AVLTree<T> where T: Comparable {
    
    private var nodeCount = 0
    private var root: AVLTreeNode?
    
    public class AVLTreeNode {
        var data: T
        var left, right: AVLTreeNode?
        var height = 0
        var balanceFactor = 0
        
        init(data: T, left: AVLTreeNode? = nil, right: AVLTreeNode? = nil) {
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
    
    private func add(_ node: AVLTreeNode?, elem: T) -> AVLTreeNode? {
        var newNode: AVLTreeNode? = node
        if node == nil { // leaf node or root is nil
            newNode = AVLTreeNode(data: elem)
        } else {
            if let data = node?.data {
                if elem < data { // check if data is smaller than current node data, add elem to left of subtree.
                    newNode?.left = add(newNode?.left, elem: elem)
                } else { // else add elem to right of current node subtree.
                    newNode?.right = add(newNode?.right, elem: elem)
                }
            }
        }
        updateHeightAndBF(node: newNode)
        return balance(node: newNode) // recursive calls will backtrack and pop from stack, and when last call pops, it returns root.
    }
    
    private func updateHeightAndBF(node: AVLTreeNode?) {
        guard let node else { return }
        
        let leftNodeHeight = node.left == nil ? -1: node.left?.height ?? .zero
        let rightNodeHeight = node.right == nil ? -1: node.right?.height ?? .zero
        
        node.height = max(leftNodeHeight, rightNodeHeight) + 1
        node.balanceFactor = rightNodeHeight - leftNodeHeight
    }
    
    private func balance(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        // Left heavy subtree.
        if node.balanceFactor == -2 {
            // leftLeftCase
            if node.left?.balanceFactor ?? .zero <= 0 {
                return leftLeftCase(node: node)
            } else {
                // leftRightCase
                return leftRightCase(node: node)
            }
        }
        // Right heavy subtree.
        else if node.balanceFactor == 2 {
            // rightRightCase
            if node.right?.balanceFactor ?? .zero >= 0 {
                return rightRightCase(node: node)
            } else {
                // rightLeftCase
                return rightLeftCase(node: node)
            }
        }
        
        // For the cases of -1, 0, +1 no balancing required.
        return node
    }
    
    private func leftLeftCase(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        return rotateRight(node: node)
    }
    
    private func leftRightCase(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        node.left = rotateLeft(node: node.left)
        return leftLeftCase(node: node)
    }
    
    private func rightRightCase(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        return rotateLeft(node: node)
    }
    
    private func rightLeftCase(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        node.right = rotateRight(node: node.right)
        return rightRightCase(node: node)
    }
    
    private func rotateLeft(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        let rightNode = node.right // new parent
        node.right = rightNode?.left
        rightNode?.left = node
        updateHeightAndBF(node: node)
        updateHeightAndBF(node: rightNode)
        return rightNode
    }
    
    private func rotateRight(node: AVLTreeNode?) -> AVLTreeNode? {
        guard let node else { return nil }
        
        let leftNode = node.left // new parent
        node.left = leftNode?.right
        leftNode?.right = node
        updateHeightAndBF(node: node)
        updateHeightAndBF(node: leftNode)
        return leftNode
    }
    
    public func remove(elem: T) -> Bool {
        if contains(elem: elem) {
            root = remove(root, elem: elem)
            nodeCount -= 1
            return true
        }
        return false
    }
    
    private func remove(_ node: AVLTreeNode?, elem: T) -> AVLTreeNode? {
        if node == nil { // base case root is nil or leaf node
            return node
        }
        var copyOfNode: AVLTreeNode? = node
        if let node {
            if elem < node.data {
                node.left = remove(copyOfNode?.left, elem: elem)
            } else if elem > node.data {
                node.right = remove(copyOfNode?.right, elem: elem)
            } else { // The element that is to be deleted is found.
                // This is the case where left subtree is nil
                // or no subtree at all. Swap parent with right subtree root.
                if node.left == nil {
                    let rightSubtreeRoot = node.right
                    copyOfNode = nil
                    return rightSubtreeRoot
                }
                // This is the case where right subtree is nil
                // or no subtree at all. Swap parent with left subtree root.
                else if node.right == nil {
                    let leftSubtreeRoot = node.left
                    copyOfNode = nil
                    return leftSubtreeRoot
                } else {
                    // Find the left most node in right subtree.
                    let temp = digLeft(node.right)
                    // Copy data of left mode node to node.
                    node.data = temp!.data
                    // Go into the right subtree and remove the leftmost node we
                    // found and swapped data with. This prevents us from having
                    // two nodes in our tree with the same value.
                    node.right = remove(node.right, elem: temp!.data)
                }
            }
            updateHeightAndBF(node: node)
            return balance(node: node)
        }
        updateHeightAndBF(node: copyOfNode)
        return balance(node: copyOfNode) // recursive calls will backtrack and pop from stack, and when last call pops, it returns root.
    }
    
    private func digLeft(_ node: AVLTreeNode?) -> AVLTreeNode? {
        var nodeCopy: AVLTreeNode? = node
        while nodeCopy?.left != nil {
            nodeCopy = nodeCopy?.left
        }
        return nodeCopy
    }
    
    public func contains(elem: T) -> Bool {
        return contains(root, elem: elem)
    }
    
    private func contains(_ node: AVLTreeNode?, elem: T) -> Bool {
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
        if root == nil {
            return .zero
        }
        return root?.height ?? .zero
    }
    
    private func height(_ node: AVLTreeNode?) -> Int {
        if let node {
            return max(height(node.left), height(node.right)) + 1
        } else {
            return 0 // base case leaf node
        }
    }
    
    public func inOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func inOrderTraversal(_ node: AVLTreeNode?) {
        if let node {
            inOrderTraversal(node.left)
            print(node.data)
            inOrderTraversal(node.right)
        }
    }
    
    public func preOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func preOrderTraversal(_ node: AVLTreeNode?) {
        if let node {
            print(node.data)
            inOrderTraversal(node.left)
            inOrderTraversal(node.right)
        }
    }
    
    public func postOrderTraversal() {
        inOrderTraversal(root)
    }
    
    private func postOrderTraversal(_ node: AVLTreeNode?) {
        if let node {
            inOrderTraversal(node.left)
            inOrderTraversal(node.right)
            print(node.data)
        }
    }
    
    private func printAVL(prefix: String, node: AVLTreeNode?, isLeft: Bool) {
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

            printAVL(prefix: prefix + (isLeft ? "│   " : "    "), node: node.left, isLeft: true)
            printAVL(prefix: prefix + (isLeft ? "│   " : "    "), node: node.right, isLeft: false)
        }
    }
    
    public func printLeaves() {
        printLeaves(node: root)
    }
    
    private func printLeaves(node: AVLTreeNode?) {
        if node == nil {
            return
        }
        if node?.left == nil && node?.right == nil {
            Swift.print(node!.data)
            return
        }
        printLeaves(node: node?.left)
        printLeaves(node: node?.right)
    }

    public func printAVL() {
        printAVL(prefix: "", node: root, isLeft: false)
    }
}
