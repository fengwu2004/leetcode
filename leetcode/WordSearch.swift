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
    
    if board[row][coloum] == "0" {
      
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
}
