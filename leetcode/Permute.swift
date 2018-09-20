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
  
  func maxProfit(_ prices: [Int]) -> Int {
   
    guard prices.count > 1 else {
      
      return 0
    }
    
    var maxvalue  = 0
    
    var i = 0
    
    for k in 1..<prices.count {
      
      if prices[k] - prices[i] > maxvalue {
        
        maxvalue = prices[k] - prices[i]
        
        continue
      }
      
      if prices[k] < prices[i] {
        
        i = k
      }
    }
    
    return maxvalue
  }
  
  func maxSubArray(_ nums: [Int]) -> Int {
    
    if nums.isEmpty {
      
      return 0
    }
    
    if nums.count == 1 {
      
      return nums[0]
    }
    
    var maxvalue = nums[0]
    
    var value = max(0, maxvalue)
    
    for k in 1..<nums.count {
      
      if nums[k] + value > maxvalue {
        
        maxvalue = nums[k] + value
      }
      
      value = max(0, nums[k] + value)
    }
    
    return maxvalue
  }
  
  func rob(_ nums: [Int]) -> Int {
   
    if nums.isEmpty {
      
      return 0
    }
    
    if nums.count == 1 {
      
      return nums[0]
    }
    
    if nums.count == 2 {
      
      return max(nums[0], nums[1])
    }
    
    var n = nums[0], m = nums[1]
    
    for i in 2..<nums.count {
      
      let temp = m
      
      m = max(nums[i] + n, m)
      
      n = max(temp, n)
    }
    
    return max(m, n)
  }
}
