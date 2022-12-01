//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var bst = BinarySearchTree<Int>()

bst.add(elem: 10)
bst.add(elem: 2)
bst.add(elem: 15)
bst.add(elem: 1)
bst.add(elem: 3)
bst.add(elem: 12)
bst.add(elem: 16)

bst.remove(elem: 1)
bst.remove(elem: 2)
bst.remove(elem: 10)

bst.printBST()
