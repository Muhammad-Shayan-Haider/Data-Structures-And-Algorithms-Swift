//
//  main.swift
//  Data Structures
//
//  Created by Muhammad Shayyan on 17/11/2022.
//

import Foundation

var avl = AVLTree<Int>()

avl.add(elem: 1)
avl.add(elem: 2)
avl.add(elem: 3)
avl.add(elem: 4)
avl.add(elem: 5)
avl.add(elem: 6)
avl.add(elem: 7)

avl.remove(elem: 7)

avl.printAVL()
