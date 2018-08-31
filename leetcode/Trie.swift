//
//  Trie.swift
//  leetcode
//
//  Created by ky on 2018/8/31.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class TrieNode {
  
  var val:Character
  
  var word:String?
  
  var children:[Character:TrieNode] = [:]
  
  func isLeaf() -> Bool {
    
    return self.children.isEmpty
  }
  
  init(_ val:Character) {
    
    self.val = val
  }
}

class Trie {
  
  var root:TrieNode
  
  init(_ words:[String]) {
    
    self.root = TrieNode(Character(""))
    
    for word in words {
      
      self.insert(word: word)
    }
  }
  
  fileprivate func insertChar(_ char:Character, node:TrieNode) -> TrieNode {
    
    guard let child = node.children[char] else {
    
      let childNode = TrieNode(char)
      
      node.children[char] = childNode
      
      return childNode
    }
    
    return child    
  }
  
  func search(_ word:String) -> Bool {
    
    for char in word {
      
      if
    }
  }
  
  func insert(word:String) -> Void {
    
    var node = self.root
    
    for char in word {
      
      node = self.insertChar(char, node: node)
    }
    
    node.word = word
  }
}

class Solution1 {
  
  private var trie:Trie?
  
  func doFind(_ board:inout [[Character]], row:Int, coloum:Int, root:TrieNode, _ str:String) {
  
    guard row < board.count, coloum < board[row].count, board[row][coloum] == root.val else {
      
      return
    }
    
  
    
    let temp = board[row][coloum]
    
    board[row][coloum] = "-"
    
    let tempStr = str + String(temp)

    for node in root.children {
 
      doFind(&board, row: row - 1, coloum: coloum, root: node, tempStr)
  
      doFind(&board, row: row + 1, coloum: coloum, root: node, tempStr)
      
      doFind(&board, row: row, coloum: coloum + 1, root: node, tempStr)
      
      doFind(&board, row: row, coloum: coloum - 1, root: node, tempStr)
    }
    
    board[row][coloum] = temp
  }
  
  func findWords(_ board:[[Character]], _ words:[String]) -> [String] {
    
    self.trie = Trie(words)
    
    var tempBoard = board
    
    for row in 0..<board.count {
      
      for coloum in 0..<board[row].count {
       
        doFind(&tempBoard, row:row, coloum:coloum, root:self.trie!.root, "")
      }
    }
  }
}
