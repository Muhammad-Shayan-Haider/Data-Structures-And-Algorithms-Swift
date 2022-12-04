//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var avl = AVLTree<Int>()
for i in 0..<10 {
    avl.add(elem: i)
}

avl.printLeaves()
avl.printAVL()
