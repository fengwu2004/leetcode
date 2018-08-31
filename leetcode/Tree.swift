//
//  Tree.swift
//  leetcode
//
//  Created by ky on 2018/8/28.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class TreeNode {
  
  var val:Int
  
  var left:TreeNode?
  
  var right:TreeNode?
  
  init(_ val:Int) {
    
    self.val = val
  }
}

class Solution_Recursive {
  
  func maxDepth(_ root:TreeNode?) -> Int {
    
    if root == nil {
      
      return 0
    }
    
    if root!.left == nil && root!.right == nil {
      
      return 1
    }
    
    return 1 + max(maxDepth(root!.left), maxDepth(root!.right))
  }
}

class Solution_Interate {
  
  func maxDepth(_ root:TreeNode?) -> Int {
    
    if root == nil {
      
      return 0
    }
    
    var arrays:[TreeNode] = []
    
    var depths:[Int] = [1]
    
    var maxdepth = 0
    
    arrays.append(root!)
    
    while arrays.count > 0 {
      
      maxdepth = depths.removeFirst()
      
      let node = arrays.removeFirst()
      
      if node.left != nil {
        
        depths.append(maxdepth + 1)
        
        arrays.append(node.left!)
      }
      
      if node.right != nil {
        
        depths.append(maxdepth + 1)
        
        arrays.append(node.right!)
      }
    }
    
    return maxdepth
  }
}

class Solution_BST {
  
  func printTree(_ root:TreeNode?, arrays:inout [Int]) {
    
    guard let root = root else {
      
      return
    }
    
    printTree(root.left, arrays: &arrays)
    
    arrays.append(root.val)
    
    printTree(root.right, arrays: &arrays)
  }
  
  func isValidBST(_ root:TreeNode?) -> Bool {
    
    var arrays:[Int] = []
    
    printTree(root, arrays: &arrays)
    
    if arrays.count <= 1 {
      
      return true
    }
    
    for index in 0..<(arrays.count - 1) {
      
      if arrays[index] > arrays[index + 1] {
        
        return false
      }
    }
    
    return false
  }
  
  func isSymmetricHelper(left:TreeNode?, right:TreeNode?) -> Bool {
    
    if left == nil && right == nil {
      
      return true
    }
    
    guard let left = left, let right = right else {
      
      return false
    }
    
    return left.val == right.val && isSymmetricHelper(left: left.left, right: right.right) && isSymmetricHelper(left:left.right, right:right.left)
  }
  
  func isSymmetric(_ root: TreeNode?) -> Bool {
   
    guard let root = root else {
      
      return true
    }
    
    return isSymmetricHelper(left: root.left, right: root.right)
  }
  
  func isSymmetric_iterate(_ root: TreeNode?) -> Bool {
    
    guard let root = root else {
      
      return true
    }
    
    var lefts:[TreeNode] = [root]
    
    var rights:[TreeNode] = [root]
    
    while lefts.count > 0 {
      
      guard let left = lefts.popLast(), let right = rights.popLast() else {
        
        return true
      }
      
      if left.val != right.val {
        
        return false
      }
      
      if (left.left == nil && right.right != nil) || (left.left != nil && right.right == nil) {
        
        return false
      }
      
      if (left.right == nil && right.left != nil) || (left.right != nil && right.left == nil) {
        
        return false
      }
      
      if left.right != nil {
        
        lefts.append(left.right!)
        
        rights.append(right.left!)
      }
      
      if left.left != nil {
        
        lefts.append(left.left!)
        
        rights.append(right.right!)
      }
    }
    
    return true
  }
  
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    guard let root = root else {
      
      return []
    }
    
    var queue:[TreeNode] = [root]
    
    var nextqueue:[TreeNode] = []
    
    var result:[[Int]] = []
    
    var temp:[Int] = []
    
    while !queue.isEmpty {
      
      temp.removeAll()
      
      nextqueue.removeAll()
      
      for node in queue {
        
        temp.append(node.val)
        
        if node.left != nil {
          
          nextqueue.append(node.left!)
        }

        if node.right != nil {
          
          nextqueue.append(node.right!)
        }
      }
      
      result.append(temp)
      
      temp.removeAll()
      
      queue = nextqueue
    }
    
    return result
  }
}
