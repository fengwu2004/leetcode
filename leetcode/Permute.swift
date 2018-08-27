//
//  Permute.swift
//  leetcode
//
//  Created by ky on 2018/8/26.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class PermuteSolution {
  
  func combin(num:Int, array:[Int]) -> [[Int]] {
  
    let count = array.count + 1
    
    var results = Array(repeating:array, count: count)
  
    for index in 0..<count {
      
      results[index].insert(num, at: index)
    }
    
    return results
  }
  
  func permute(_ nums: [Int]) -> [[Int]] {
    
    if nums.count == 1 {
      
      return [nums]
    }

    var result:[[Int]] = []
    
    let num = nums[0]
    
    var temp = Array(nums)
    
    temp.remove(at: 0)
    
    let arrays = self.permute(temp)
    
    for array in arrays {
      
      result.append(contentsOf: self.combin(num: num, array: array))
    }
    
    return result
  }
}
