//
//  ArraySolution.swift
//  leetcode
//
//  Created by ky on 2018/9/2.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class ListNode {
  
  public var val:Int
  
  var next:ListNode?
  
  init(_ val:Int) {
    
    self.val = val
    
    self.next = nil
  }
  
  func display() -> Void {
    
    print(self.val)
    
    var node = self.next
    
    while node != nil {
      
      print(node!.val)
      
      node = node?.next
    }
  }
}

class Solution1 {
  
  func removeDuplicates(_ nums:inout [Int]) -> Int {
    
    guard nums.count > 1 else {
      
      return nums.count
    }
    
    var start = 0
    
    for next in 1..<nums.count {
        
      if nums[start] != nums[next] {
        
        start += 1
          
        nums[start] = nums[next]
      }
    }
    
    return start + 1
  }
  
  func maxProfit(_ prices: [Int]) -> Int {
   
    if prices.count <= 1 {
      
      return 0
    }
    
    var sum = 0
    
    for index in 1..<prices.count {
      
      let profit = prices[index] - prices[index - 1]
      
      if profit > 0 {
        
        sum += profit
      }
    }
    
    return sum
  }
  
  func rotate(_ nums: inout [Int], _ k: Int) {
 
    guard nums.count > 1, k > 0 else {
      
      return
    }
    
    var i = 0
    
    var j = k % nums.count
    
    var temp = nums[i]
    
    for _ in 0..<nums.count {
      
      swap(&nums[j], &temp)
      
      if j == i {
        
        i = (i + 1) % nums.count
        
        j = (i + k) % nums.count
        
        temp = nums[i]
      }
      else {
        
        j = (j + k) % nums.count
      }
    }
  }
  
  func containsDuplicate(_ nums: [Int]) -> Bool {
    
    guard nums.count > 1 else {
      
      return false
    }
    
    var or = nums[0]
    
    var prev = 0
    
    for i in 1..<nums.count {

      let temp = or ^ nums[i]
      
      if temp == prev {
        
        return true
      }
      
      prev = or
      
      or = temp
    }
    
    return false
  }
  
  func singleNumber(_ nums: [Int]) -> Int {
    
    var sum = 0
    
    nums.forEach { num in
      
      sum = sum ^ num
    }
    
    return sum
  }
  
  func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    guard nums2.count > 0, nums1.count > 0 else {
      
        return []
    }
    
    var nums1temp = nums1.sorted(by: <)
    
    var nums2temp = nums2.sorted(by: <)
    
    var i = 0, j = 0
    
    var results:[Int] = []
    
    while i < nums1temp.count && j < nums2temp.count {
      
      if nums1temp[i] < nums2temp[j] {
        
        i += 1
      }
      else if nums1temp[i] > nums2temp[j] {
        
        j += 1
      }
      else {
        
        results.append(nums1temp[i])
        
        i += 1
        
        j += 1
      }
    }
    
    return results
  }
  
  func plusOne(_ digits: [Int]) -> [Int] {
    
    var nums = digits
    
    for i in (0..<nums.count).reversed() {
      
      if nums[i] < 9 {
        
        nums[i] = nums[i] + 1
        
        return nums
      }
      else {
        
        nums[i] = 0
      }
    }
    
    nums.insert(1, at: 0)
    
    return nums
  }
  
  func moveZeroes(_ nums: inout [Int]) {
    
    guard nums.count > 1 else {
      
      return
    }
    
    var i = 0, j = 0
    
    while i < nums.count && j < nums.count {
      
      if nums[i] != 0 {
        
        i += 1
        
        j = i + 1
        
        continue
      }
      
      if nums[j] == 0 {
        
        j += 1
        
        continue
      }
      
      nums.swapAt(i, j)
      
      i += 1
      
      j += 1
    }
  }
  
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
   
    let sortedNums = nums.sorted(by: <)
    
    var i = 0, j = nums.count - 1
    
    while i < sortedNums.count && j >= 0 && i < j {
      
      if sortedNums[i] + sortedNums[j] < target {
        
        i += 1
      }
      else if sortedNums[i] + sortedNums[j] > target {
        
        j -= 1
      }
      else {
        
        break
      }
    }
    
    var results:[Int] = []
    
    for index in 0..<nums.count {
      
      if nums[index] == sortedNums[i] {
        
        results.append(index)
        
        break
      }
    }
    
    for index in 0..<nums.count {
      
      if nums[index] == sortedNums[j] && index != results[0] {
        
        results.append(index)
        
        break
      }
    }
    
    return [i, j]
  }
  
  let values:[Character:Int] = ["1":0, "2":1, "3":2, "4":3, "5":4, "6":5, "7":6, "8":7, "9":8]
  
  func getIntOfCharacter(_ char:Character) -> Int {
    
    if self.values[char] == nil {
      
      return -1
    }
    
    return self.values[char]!
  }
  
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    for i in 0..<9 {
    
      var row = Array(repeating: false, count: 9)
      
      var coloum = Array(repeating: false, count: 9)
      
      for j in 0..<9 {
        
        if self.getIntOfCharacter(board[i][j]) != -1  {
          
          if row[self.getIntOfCharacter(board[i][j])] != true {
            
            row[self.getIntOfCharacter(board[i][j])] = true
          }
          else {
            
            return false
          }
        }
        
        if self.getIntOfCharacter(board[j][i]) != -1  {
          
          if coloum[self.getIntOfCharacter(board[j][i])] != true {
            
            coloum[self.getIntOfCharacter(board[j][i])] = true
          }
          else {
            
            return false
          }
        }
      }
    }
    
    for m in 0..<3 {
      
      for n in 0..<3 {
        
        var line = Array(repeating: false, count: 9)
        
        for i in (m*3)..<(m+1) * 3 {
          
          for j in (n*3)..<(n+1) * 3 {
            
            if self.getIntOfCharacter(board[i][j]) != -1 {
              
              if line[self.getIntOfCharacter(board[i][j])] == true {
                
                return false
              }
              else {
                
                line[self.getIntOfCharacter(board[i][j])] = true
              }
            }
          }
        }
      }
    }
    
    return true
  }
  
  func rotate(_ matrix: inout [[Int]]) {
    
    for i in 0..<matrix.count {
      
      for j in i..<matrix.count {
    
        let temp = matrix[i][j]
        
        matrix[i][j] = matrix[j][i]
        
        matrix[j][i] = temp
      }
    }
    
    var i = 0, j = matrix.count - 1
    
    while i < matrix.count && j >= 0 && i <= j {
      
      for row in 0..<matrix.count {
        
        let temp = matrix[row][i]
        
        matrix[row][i] = matrix[row][j]
        
        matrix[row][j] = temp
      }
      
      i += 1
      
      j -= 1
    }
  }

  func reverseString(_ s: String) -> String {
    
    guard s.count > 1 else {
      
      return s
    }

    var chars = s.cString(using: .utf8)!
    
    var i = 0, j = s.count - 1
    
    while i < j {
      
      let temp = chars[i]
      
      chars[i] = chars[j]
      
      chars[j] = temp
      
      i += 1
      
      j -= 1
    }
    
    return String(utf8String: chars)!
  }
  
  let charofnum:[Character:Int] = ["1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "0":0]
  
  func reverse(_ x: Int) -> Int {
    
    let negative = x < 0
    
    let temp = negative ? -1 * x : x
    
    let nums = String(temp, radix: 10, uppercase: false).reversed()
    
    var value = 0
    
    for char in nums {
      
      value *= 10
      
      value += charofnum[char]!
    }
    
    if negative {
      
      value *= -1
    }
    
    if value > Int32.max || value < Int32.min {
      
      return 0
    }
    
    return value
  }
  
  func firstUniqChar(_ str: String) -> Int {
    
    guard !str.isEmpty else {
      
      return -1
    }
    
    var values = Array(repeating: -1, count: 26)
    
    let a = 97
    
    var i = 0
    
    for j in str.unicodeScalars {
      
      let diff = Int(Int(j.value) - a)
      
      if values[diff] == -2 {
    
        i += 1
        
        continue
      }
      
      if values[diff] == -1 {
        
        values[diff] = i
      }
      else {
        
        values[diff] = -2
      }
      
      i += 1
    }
    
    var minIndex = Int.max
    
    for value in values {
      
      if value == -2 || value == -1 {
        
        continue
      }
      
      minIndex = min(minIndex, value)
    }
    
    if minIndex == Int.max {
      
      return -1
    }
    
    return minIndex
  }
  
  func isAnagram(_ s: String, _ t: String) -> Bool {
  
    if s.count != t.count {
      
      return false
    }
    
    var a = s.unicodeScalars.map {$0.value}
    
    a.sort()
    
    var b = t.unicodeScalars.map {$0.value}
    
    b.sort()
    
    var i = 0
    
    while i < a.count {
      
      if a[i] != b[i] {
        
        return false
      }
      
      i += 1
    }
    
    return true
  }

  func isPalindrome(_ s: String) -> Bool {
    
    guard s.count > 1 else {
      
      return true
    }
    
    let zero = 48, nine = 57, A = 65, Z = 90, a = 97, z = 122
    
    var unicodearrays = s.unicodeScalars.map {$0.value}
    
    var i = 0, j = unicodearrays.count - 1
    
    while i < j {
      
      if unicodearrays[i] == unicodearrays[j] {
        
        i += 1
        
        j -= 1
        
        continue
      }
      
      guard (unicodearrays[i] >= zero && unicodearrays[i] <= nine) || (unicodearrays[i] >= A && unicodearrays[i] <= Z) || (unicodearrays[i] >= a && unicodearrays[i] <= z) else {
        
        i += 1
        
        continue
      }
      
      guard (unicodearrays[j] >= zero && unicodearrays[j] <= nine) || (unicodearrays[j] >= A && unicodearrays[j] <= Z) || (unicodearrays[j] >= a && unicodearrays[j] <= z) else {
        
        j -= 1
        
        continue
      }
      
      if Int(unicodearrays[i]) <= Z && Int(unicodearrays[i]) >= A {
        
        if Int(unicodearrays[i]) - A == Int(unicodearrays[j]) - a {
          
          i += 1
          
          j -= 1
          
          continue
        }
      }
      
      if Int(unicodearrays[i]) <= z && Int(unicodearrays[i]) >= a {
        
        if Int(unicodearrays[i]) - a == Int(unicodearrays[j]) - A {
          
          i += 1
          
          j -= 1
          
          continue
        }
      }
      
      return false
    }
    
    return true
  }
  
  func myAtoi(_ str: String) -> Int {
    
    let negative = 45, posiz = 43, zero = 48, nine = 57, empty = 32
    
    var unicodearrays = str.unicodeScalars.map {$0.value}
    
    var result = 0
    
    var i = 0
    
    var meetnum = false
    
    var isNeg = 1
    
    while i < unicodearrays.count {
      
      if !meetnum {
        
        if unicodearrays[i] == empty {
          
          i += 1
          
          continue
        }
        
        if unicodearrays[i] == negative {
        
          i += 1
          
          isNeg = -1
          
          meetnum = true
          
          continue
        }
        
        if unicodearrays[i] == posiz {
          
          i += 1
          
          meetnum = true
          
          continue
        }
      }
      
      if unicodearrays[i] < zero || unicodearrays[i] > nine {
        
        break
      }
     
      meetnum = true
      
      if isNeg == 1 {
        
        if result > (Int32.max - Int32(unicodearrays[i]) + Int32(zero)) / 10  {
          
          return Int(Int32.max)
        }
      }
      else {
        
      if result > (Int32.min + Int32(unicodearrays[i]) - Int32(zero)) / -10 {
          
          return Int(Int32.min)
        }
      }
      
      result = result * 10 + Int(unicodearrays[i]) - zero
      
      i += 1
    }
    
    return result * isNeg
  }

  func createNextArray(_ str:String) -> [Int] {
    
    var next = Array(repeating: 0, count: str.count)
    
    var i = 1, j = 0
    
    while i < str.count {
      
      if str[str.index(str.startIndex, offsetBy: i)] == str[str.index(str.startIndex, offsetBy: j)] {
        
        next[i] = j + 1
        
        i += 1
        
        j += 1
        
        continue
      }
        
      if j == 0 {
        
        next[i] = 0
        
        i += 1
      }
      else {
        
        j = next[j - 1]
      }
    }
    
    print(next)
    
    return next
  }
  
  func strStr(_ haystack: String, _ needle: String) -> Int {
    
    guard !needle.isEmpty else {
      
      return 0
    }
    
    guard haystack.count >= needle.count else {
      
      return -1
    }
    
    guard let a = haystack.range(of: needle) else {
      
      return -1
    }
    
    return haystack.distance(from: haystack.startIndex, to: a.lowerBound)
  }
  
  func strStr_(_ haystack: String, _ needle: String) -> Int {
    
    guard !needle.isEmpty else {
      
      return 0
    }
  
    guard haystack.count >= needle.count else {
      
      return -1
    }
    
    let next = createNextArray(needle)
    
    var i = 0, j = 0
    
    while i < haystack.count && j < needle.count {
      
      if haystack[haystack.index(haystack.startIndex, offsetBy: i)] == needle[needle.index(needle.startIndex, offsetBy: j)] {
        
        i += 1
        
        j += 1
        
        continue
      }
      
      if j == 0 {
        
        i += 1
      }
      else {
        
        j = next[j - 1]
      }
    }
    
    if j == needle.count {
      
      return i - j
    }
    
    return -1
  }
  
  func countAndSay(_ n: Int) -> String {
    
    var num = n
    
    var say = "1"
    
    while num > 1 {
      
      var i = say.startIndex
      
      var s = ""
      
      var count = 1
      
      for _ in 0..<say.count {
        
        let j = say.index(after: i)
        
        if j == say.endIndex {
          
          s += String(count) + String(say[i])
          
          break
        }
        
        if say[j] != say[i] {
          
          s += String(count) + String(say[i])
          
          i = j
          
          count = 1
        }
        else {
          
          count += 1
          
          i = j
        }
      }
      
      say = s
      
      num -= 1
    }
    
    return say
  }
  
  func countAndSay_(_ n: Int) -> String {
  
    var num = n
    
    var d = -1
    
    var count = 0
    
    var s = ""
    
    while num > 0 {
      
      if num % 10 == d || d == -1 {
        
        d = num % 10
        
        count += 1
      }
      else {
        
        s += String(count * 10 + d)
        
        d = num % 10
        
        count = 1
      }
      
      num = num / 10
    }
    
    s += String(count * 10 + d)
    
    return s
  }
  
  func longestCommonPrefix(_ strs: [String]) -> String {
   
    if strs.isEmpty {
      
      return ""
    }
    
    if strs[0].isEmpty {
      
      return ""
    }
    
    var j = 0
    
    var result = ""
    
    while j < strs[0].count {
    
      var index = strs[0].index(strs[0].startIndex, offsetBy: j)
      
      let c = strs[0][index]
      
      for i in 1..<strs.count {
        
        if j >= strs[i].count {
          
          return result
        }
        
        index = strs[i].index(strs[i].startIndex, offsetBy: j)
        
        if strs[i][index] != c {
          
          return result
        }
      }
      
      result += String(c)
      
      j += 1
    }
    
    return result
  }
  
  func createNodeList(_ array:[Int]) -> ListNode? {
    
    if array.count < 1 {
      
      return nil
    }
    
    let head = ListNode(array[0])
    
    var curr = head
    
    for i in 1..<array.count {
      
      curr.next = ListNode(array[i])
      
      curr = curr.next!
    }
    
    return head
  }
  
  func reverseList_(_ head: ListNode?) -> ListNode? {
    
    guard head != nil && head?.next != nil else {
      
      return head
    }
    
    var newhead = head
    
    var next = newhead!.next
    
    newhead?.next = nil

    while next != nil {
      
      let curr = next!
      
      next = next!.next
      
      curr.next = newhead
      
      newhead = curr
    }
    
    return newhead
  }
  
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
   
    if n == 0 {
      
      return head
    }
    
    var end = head
    
    var cur = head
    
    for _ in 1...n {
      
      end = end?.next
    }
    
    if end == nil {
      
      return head?.next
    }
    
    while end?.next != nil {
      
      end = end!.next
      
      cur = cur!.next
    }
    
    cur?.next = cur?.next?.next
    
    return head
  }
  
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
   
    if l1 == nil {
      
      return l2
    }
    
    if l2 == nil {
      
      return l1
    }
    
    let n1 = l1!, n2 = l2!
    
    let (x, y) = n1.val < n2.val ? (n1, n2) : (n2, n1)
    
    let l = mergeTwoLists(x.next, y)
    
    x.next = l
    
    return x
  }
  
  func reserseList_healper(_ head:ListNode?) -> (head:ListNode?, tail:ListNode?) {
    
    if head == nil || head!.next == nil {
      
      return (head, head)
    }
    
    let headtail = reserseList_healper(head?.next)
    
    headtail.tail?.next = head
    
    head?.next = nil
    
    return (headtail.head, head)
  }
  
  func reverseList(_ head: ListNode?) -> ListNode? {
    
    guard head != nil && head?.next != nil else {
      
      return head
    }
    
    let nodes = reserseList_healper(head)
    
    return nodes.head
  }

  
  func isPalindrome(_ head: ListNode?) -> Bool {
   
    guard head != nil && head?.next != nil else {
      
      return true
    }
    
    var n1 = head
    
    var n2 = head
    
    while n2 != nil {
      
      n2 = n2?.next
      
      if n2 != nil {
        
        n1 = n1?.next
        
        n2 = n2?.next
      }
    }
    
    var n1v = reverseList(n1)
    
    n1 = head
    
    while n1v != nil {
      
      if n1?.val != n1v?.val {
        
        return false
      }
      
      n1 = n1?.next
      
      n1v = n1v?.next
    }
    
    return true
  }
  
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
   
    var k = m + n - 1
    
    var i = m - 1, j = n - 1
    
    while k >= 0 && j >= 0 {
      
      if i >= 0 {
        
        if nums1[i] < nums2[j] {
          
          nums1[k] = nums2[j]
          
          j -= 1
          
          k -= 1
        }
        else {
          
          nums1[k] = nums1[i]
          
          i -= 1
          
          k -= 1
        }
        
        continue
      }
     
      if j >= 0 {
        
        nums1[k] = nums2[j]
        
        j -= 1
        
        k -= 1
      }
    }
  }
  
  var results:[Int:Int] = [:]
  
  func climbStairs(_ n: Int) -> Int {
    
    if n <= 3 {
      
      return n
    }
    
    if results[n] != nil {
      
      return results[n]!
    }
    
    results[n] = climbStairs(n - 1) + climbStairs(n - 2)
    
    return results[n]!
  }
}
