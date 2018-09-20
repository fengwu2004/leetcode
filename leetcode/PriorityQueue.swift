//
//  PriorityQueue.swift
//  leetcode
//
//  Created by ky on 2018/9/13.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class PriorityQueue {
  
  var array:[Int] = [0]
  
  var currentSize = 0
  
  init(_ nums:[Int]) {
    
    for num in nums {
      
      self.insert(num)
    }
  }
  
  func insert(_ value:Int) {
    
    array.append(value)
    
    currentSize += 1
    
    if currentSize <= 1 {
      
      return
    }
    
    var i = currentSize
    
    while i > 0 {
      
      let p = i / 2
      
      if array[i] < array[p] {
        
        return
      }
    
      array.swapAt(i, p)
      
      i = p
    }
  }
  
  func deleteMin() {
    
    array[1] = array[currentSize]
    
    currentSize -= 1
    
    var i = 1
    
    var child = 2 * i
    
    while child <= currentSize {
      
      if child != currentSize && array[child + 1] < array[child] {
        
        child += 1
      }
      
      if array[child] < array[i] {
        
        array.swapAt(child, i)
        
        i = child
      }
      else {
        
        break
      }
    }
  }
}
