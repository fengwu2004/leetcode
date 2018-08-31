//
//  WordSearch.swift
//  leetcode
//
//  Created by ky on 2018/8/27.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class WordSearch {
  
  func getChar(row:Int, coloum:Int, _ board:inout [[Character]], _ bools:[[Bool]]) -> Character? {
    
    if row < 0 || row >= board.count {
      
      return nil
    }
    
    if coloum < 0 || coloum >= board[row].count {
      
      return nil
    }
    
    if bools[row][coloum] {
      
      return nil
    }
    
    return board[row][coloum]
  }
  
  func checkExit(_ board: inout [[Character]], row:Int, coloum:Int, word:inout String, offset:Int, _ bools:inout [[Bool]]) -> Bool {
    
    let index = word.index(word.startIndex, offsetBy: offset)
    
    if index >= word.endIndex {
      
      return true
    }
    
    let char = word[index]
    
    if let upper = self.getChar(row: row - 1, coloum: coloum, &board, bools) {
      
      if upper == char {
        
        bools[row - 1][coloum] = true
        
        if self.checkExit(&board, row:row - 1, coloum:coloum, word:&word, offset:offset + 1, &bools) {
          
          return true
        }
        
        bools[row - 1][coloum] = false
      }
    }
    
    if let lower = self.getChar(row: row + 1, coloum: coloum, &board, bools) {
      
      if lower == char {
       
        bools[row + 1][coloum] = true
        
        if self.checkExit(&board, row:row + 1, coloum:coloum, word:&word, offset:offset + 1, &bools) {
          
          return true
        }
        
        bools[row + 1][coloum] = false
      }
    }
    
    if let left = self.getChar(row: row, coloum: coloum - 1, &board, bools) {
      
      if left == char {
        
        bools[row][coloum - 1] = true
        
        if self.checkExit(&board, row:row, coloum:coloum - 1, word:&word, offset:offset + 1, &bools) {
          
          return true
        }
        
        bools[row][coloum - 1] = false
      }
    }
    
    if let right = self.getChar(row: row, coloum: coloum + 1, &board, bools) {
      
      if right == char {
        
        bools[row][coloum + 1] = true
        
        if self.checkExit(&board, row:row, coloum:coloum + 1, word:&word, offset:offset + 1, &bools) {
          
          return true
        }
        
        bools[row][coloum + 1] = false
      }
    }
    
    return false
  }
  
  func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    if word.count == 0 {
      
      return false
    }
    
    var bools:[[Bool]] = Array()
    
    for row in 0..<board.count {
      
      bools.append(Array(repeating: false, count: board[row].count))
    }
    
    var tempBoard = board
    
    var tempWord = word
    
    for row in 0..<board.count {
      
      for coloum in 0..<board[row].count {
        
        if board[row][coloum] == word.first {
      
          bools[row][coloum] = true
          
          if self.checkExit(&tempBoard, row: row, coloum: coloum, word: &tempWord, offset:1, &bools) {
            
            return true
          }
          else {
            
            bools[row][coloum] = false
          }
        }
      }
    }
    
    return false
  }

  func sortedArrayToBST_Helper(_ nums:inout [Int], start:Int, end:Int) -> TreeNode? {
    
    if start > end {
      
      return nil
    }
    
    let middle = (start + end)/2
    
    let node = TreeNode(nums[middle])
    
    node.left = sortedArrayToBST_Helper(&nums, start: start, end: middle - 1)
    
    node.right = sortedArrayToBST_Helper(&nums, start: middle + 1, end: end)
    
    return node
  }
  
  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    if nums.isEmpty {
      
      return nil
    }
    
    var arrays = nums
    
    let root = sortedArrayToBST_Helper(&arrays, start: 0, end: nums.count - 1)
    
    return root
  }
  
  let tels:[String] = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  
  let digitdic:[Character:Int] = ["2":0, "3":1, "4":2, "5":3, "6":4, "7":5, "8":6, "9":7]
  
  func letterCombinations(_ digits: String) -> [String] {
    
    if digits.isEmpty {
      
      return []
    }
  
    var temp = digits
    
    let digit = temp.removeFirst()
    
    guard let num = digitdic[digit], num >= 0, num <= 7 else {
      
      return []
    }
    
    let words = letterCombinations(temp)
    
    var results:[String] = []
    
    for telchar in tels[num] {
    
      if words.isEmpty {
        
        results.append(String(telchar))
      }
      else {
        
        for word in words {
          
          results.append(String(telchar) + word)
        }
      }
    }
    
    return results
  }
  
  func dogenerateParenthesis(left:Int, right:Int) -> [String] {
    
    if left > right {
      
      return []
    }
    
    if left == 0 {
      
      return [String(repeating: ")", count: right)];
    }
    
    var words = dogenerateParenthesis(left: left - 1, right: right)
    
    var results:[String] = []
    
    for word in words {
      
      results.append(String("(") + word)
    }
    
    if left < right {
      
      words = dogenerateParenthesis(left: left, right: right - 1)
      
      for word in words {
        
        results.append(String(")") + word)
      }
    }
    
    return results
  }
  
  func generateParenthesis(_ n: Int) -> [String] {
   
    return dogenerateParenthesis(left: n, right: n)
  }
  
  func subsets_iterate(_ nums: [Int]) -> [[Int]] {
    
    if nums.isEmpty {
      
      return []
    }
    
    var temps:[[Int]] = [[]]
    
    var result = temps
    
    for num in nums {
      
      result = temps
      
      for item in result {
        
        var temp = item
        
        temp.append(num)
        
        temps.append(temp)
      }
    }
    
    return temps
  }
  
  func subsets(_ nums: [Int]) -> [[Int]] {
    
    if nums.isEmpty {
      
      return []
    }
    
    let first = nums[0]
    
    let items = subsets(Array(nums[1...]))
    
    var results = Array(items)
    
    for item in items {
      
      var temp = item
      
      temp.append(first)
      
      results.append(temp)
    }
    
    return results
  }
  
  func isPartitionAfter(_ s:String, added:String) -> Bool {
    
    let newStr = added + s
    
    let tempStr = String(newStr.reversed())
    
    return newStr == tempStr
  }
  
  func partition(_ s: String) -> [[String]] {
    
    if s.isEmpty {
      
      return []
    }
    
    if s.count == 1 {
      
      return [[s]]
    }
    
    let first = String(s.first!)
    
    let startIndex = String.Index.init(encodedOffset: 1)
    
    let subs = partition(String(s[startIndex...]))
    
    var results:[[String]] = []
    
    for sub in subs {
      
      var temp = sub
      
      temp.insert(first, at: 0)
      
      results.append(temp)
      
      if isPartitionAfter(sub[0], added: first) {
        
        temp = sub
        
        temp[0] = first + sub[0]
        
        results.append(temp)
      }
      
      if sub.count > 1 {
        
        if !isPartitionAfter(sub[0], added: sub[1]) {
          
          if isPartitionAfter(sub[0] + sub[1], added: first) {
            
            temp = sub
            
            temp.removeFirst()
            
            temp[0] = first + sub[0] + sub[1]
            
            results.append(temp)
          }
        }
      }
    }
    
    return results
  }
}
