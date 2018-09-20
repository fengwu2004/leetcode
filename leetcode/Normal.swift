//
//  Normal.swift
//  leetcode
//
//  Created by ky on 2018/9/9.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation

class Queue<T> {
  
  private var array:[T]?
  
  func isEmpty() -> Bool {
    
    guard array != nil && array!.count != 0 else {
      
      return true
    }
    
    return false
  }
  
  func inQueue(_ val:T) {
    
    if array == nil {
      
      array = Array()
    }
    
    array?.insert(val, at: 0)
  }
  
  func outQueue() -> T? {
    
    return array?.popLast()
  }
}

class Stack<T> {
  
  private var array:[T]?
  
  func isEmpty() -> Bool {
    
    guard array != nil else {
      
      return true
    }
    
    return array!.count == 0
  }
  
  func push(_ val:T) -> Void {
    
    if array == nil {
      
      array = []
    }
    
    array!.append(val)
  }
  
  func peak() -> T? {
    
    return array?.last
  }
  
func pop() -> T? {
    
    return array?.popLast()
  }
}

class Interval {
  
  var start:Int
  
  var end:Int
  
  init(_ start:Int, _ end:Int) {
    
    self.start = start
    
    self.end = end
  }
}

class Normal {
  
  func longestPalindrome(_ s: String) -> String {
    
    if s.count <= 1 {
      
      return s
    }
    
    var str = "*"
    
    for char in s {
      
      str.append(char)
      
      str += "*"
    }
    
    var rl:[Int] = Array(repeating: 0, count: str.count)
    
    var p = 0, maxright = 0, maxMiddle = 0
    
    var chars = str.cString(using: .utf8)!
    
    for i in 1..<str.count {
      
      var count = 0
      
      let maxleft = p - maxright
      
      let j = 2 * p - i
      
      if j >= 0 && i < p + maxright {
        
        rl[i] = min(rl[j], j - maxleft)
        
        rl[i] = max(0, rl[i])
      }
      
      while i + rl[i] + 1 < str.count && i - rl[i] - 1 >= 0 && chars[i + rl[i] + 1] == chars[i - rl[i] - 1] {
        
        rl[i] += 1
        
        count += 1
      }
      
      if rl[maxMiddle] < rl[i] {
        
        maxMiddle = i
      }
      
      if p + maxright < i + rl[i] {
        
        p = i
        
        maxright = rl[i]
      }
    }
    
    let startindex = s.index(s.startIndex, offsetBy: maxMiddle/2 - rl[maxMiddle]/2)
    
    let endIndex = s.index(startindex, offsetBy: rl[maxMiddle])
    
    return String(s[startindex..<endIndex])
  }
  
  func increasingTriplet(_ nums: [Int]) -> Bool {
   
    guard nums.count >= 3 else {
      
      return false
    }
    
    var minvalue = nums[0]
    
    var middle = Int.max
    
    var mintemp = nums[0]
    
    for i in 1..<(nums.count - 1) {
      
      if nums[i] <= mintemp {
        
        if middle != Int.max {
          
          mintemp = nums[i]
        }
        else {
          
          minvalue = nums[i]
          
          mintemp = minvalue
          
          middle = Int.max
        }
      }
      else if nums[i] <= middle {
        
        middle = nums[i]
        
        minvalue = mintemp
      }
      else {
        
        return true
      }
    }
    
    return minvalue < middle && middle < nums.last!
  }
  
  func lengthOfLongestSubstring(_ s: String) -> Int {
    
    if s.isEmpty {
      
      return 0
    }
    
    var alphabet:[Character:Int] = [:]
    
    var maxvalue = 1
    
    var start = 0
    
    var i = 0
    
    for char in s {
      
      if alphabet[char] == nil {
        
        alphabet[char] = i
      }
      else {
        
        start = max(start, alphabet[char]! + 1)
        
        alphabet[char] = i
      }
      
      maxvalue = max(maxvalue, i - start + 1)
      
      i += 1
    }
    
    return maxvalue
  }
  
  func threeSum(_ nums_: [Int]) -> [[Int]] {
   
    var nums = nums_.sorted(by: <)
    
    if nums.count < 3 {
      
      return []
    }
    
    var i = 0
    
    var results:[[Int]] = []
    
    while i < nums.count {
      
      var left = i + 1
      
      var right = nums.count - 1
      
      if i > 0 && nums[i] == nums[i - 1] {
        
        i += 1
        
        continue
      }
      
      while left < right {
        
        let sum = nums[i] + nums[left] + nums[right]
        
        if sum < 0 {
          
          left += 1
        }
        else if sum > 0 {
          
          right -= 1
        }
        else {
          
          results.append([nums[i], nums[left], nums[right]])
          
          while left < right && nums[left] == nums[left + 1] {

            left += 1
          }

          while left < right && nums[right] == nums[right - 1] {

            right -= 1
          }
          
          left += 1
          
          right -= 1
        }
      }
      
      i += 1
    }
    
    return results
  }
  
  func groupAnagrams(_ strs: [String]) -> [[String]] {
  
    var results:[String:[String]] = [:]
    
    for str in strs {
      
      let temp = String(str.sorted())
      
      if results[temp] == nil {
        
        results[temp] = [str]
      }
      else {
        
        results[temp]!.append(str)
      }
    }
    
    var values:[[String]] = []
    
    for key in results.keys {
      
      values.append(results[key]!)
    }
    
    return values
  }
  
  func setZeroes(_ matrix: inout [[Int]]) {
    
    var firstrow = false
    
    var firstcoloum = false
    
    for i in 0..<matrix.count {
      
      if matrix[i][0] == 0 {
        
        firstcoloum = true
        
        break
      }
    }
    
    for i in 0..<matrix[0].count {
      
      if matrix[0][i] == 0 {
        
        firstrow = true
        
        break
      }
    }
    
    for i in 1..<matrix.count {
      
      for j in 1..<matrix[i].count {
        
        if matrix[i][j] == 0 {
          
          matrix[i][0] = 0
          
          matrix[0][j] = 0
        }
      }
    }
    
    for i in 1..<matrix.count {
      
      if matrix[i][0] == 0 {
        
        for j in 1..<matrix[i].count {
          
          matrix[i][j] = 0
        }
      }
    }
    
    for j in 1..<matrix[0].count {
      
      if matrix[0][j] == 0 {
        
        for i in 1..<matrix.count {
          
          matrix[i][j] = 0
        }
      }
    }
    
    if firstrow {
      
      for i in 0..<matrix[0].count {
        
        matrix[0][i] = 0
      }
    }
    
    if firstcoloum {
      
      for i in 0..<matrix.count {
        
        matrix[i][0] = 0
      }
    }
  }
  
  func sortColors(_ nums: inout [Int]) {
   
    guard nums.count > 0 else {
      
      return
    }
    
    var i = 0, j = nums.count - 1, k = j
    
    while i <= j {
      
      if nums[i] == 0 {
        
        i += 1
        
        continue
      }
      
      if nums[j] == 2 {
        
        if nums[k] == 1 {
          
          nums.swapAt(k, j)
          
          k -= 1
          
          j -= 1
        }
        else {
          
          j -= 1
          
          k = j
        }
        
        continue
      }
      
      if nums[j] == 0 {
        
        nums.swapAt(i, j)
        
        i += 1
      }
      else {
        
        if nums[j] == 2 {
          
          nums.swapAt(j, k)
          
          k -= 1
        }
        
        j -= 1
      }
    }
  }
  
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
   
    var frequent:[Int:Int] = [:]
    
    for num in nums {
      
      if frequent[num] == nil {
        
        frequent[num] = 0
      }
      else {
        
        frequent[num]! += 1
      }
    }
    
    var results = Array(repeating: [], count: nums.count)
    
    for key in frequent.keys {
      
      results[frequent[key]!].append(key)
    }
    
    var j = k
    
    var maxfrequent:[Int] = []
    
    for i in (0..<results.count).reversed() {
      
      if results[i].isEmpty {
        
        continue
      }
      
      for value in results[i] {
      
        maxfrequent.append(value as! Int)
        
        j -= 1
        
        if j == 0 {
          
          return maxfrequent
        }
      }
    }
    
    return maxfrequent
  }
  
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
      
      var p = i / 2
      
      while i > 0 && array[i] < array[p] {
        
        array.swapAt(i, p)
        
        i = p
        
        p = i / 2
      }
    }
    
    func getMin() -> Int {
      
      if currentSize < 1 {
        
        return Int.min
      }
      
      return array[1]
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
          
          child = 2 * i
        }
        else {
          
          break
        }
      }
    }
  }
  
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

    var n = nums.count - k + 1
    
    let pq = PriorityQueue(nums)
    
    while n > 1 {
      
      pq.deleteMin()
      
      n -= 1
    }
    
    return pq.getMin()
  }
  
  func findPeakElement(_ nums: [Int]) -> Int {
   
    var left = 0, right = nums.count - 1
    
    while left < right {
      
      let mid = (left + right)/2
      
      if nums[mid] > nums[mid + 1] {
        
        right = mid
      }
      else {
        
        left = mid + 1
      }
    }
    
    return left
  }
  
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
   
    guard !nums.isEmpty && nums[0] <= target && nums.last! >= target else {
      
      return [-1, -1]
    }
    
    var i = 0, j = nums.count - 1, mid = (i + j)/2
    
    var find = false
    
    while i < j {
      
      if nums[mid] < target {
        
        i = mid + 1
        
        mid = (i + j)/2
      }
      else if nums[mid] > target {
        
        j = mid - 1
        
        mid = (i + j)/2
      }
      else {
        
        find = true
        
        break
      }
    }
    
    if i == j && nums[i] == target {
      
      return [i, j]
    }
    
    if find == false {
      
      return [-1, -1]
    }
    
    var left = mid, right = mid
    
    while i < left {
      
      if nums[(i + left)/2] < target {
        
        i = (i + left)/2 + 1
      }
      else {
        
        left = (i + left)/2
      }
    }
    
    while right < j {
      
      if nums[(j + right)/2 + 1] > target {
        
        j = (j + right)/2
      }
      else {
        
        right = (j + right)/2 + 1
      }
    }
    
    return [left, right]
  }

  func merge(_ intervals: [Interval]) -> [Interval] {
   
    guard !intervals.isEmpty else {
      
      return intervals
    }
    
    let sortedIntervals = intervals.sorted { (a, b) -> Bool in
      
      return a.start < b.start
    }
    
    var results:[Interval] = []
    
    for interval in sortedIntervals {
      
      if results.isEmpty || results.last!.end < interval.start {
        
        results.append(interval)
        
        continue
      }
      
      results[results.count - 1] = Interval(results.last!.start, max(interval.end, results.last!.end))
    }
    
    return results
  }
  
  func search(_ nums: [Int], _ target: Int) -> Int {
   
    guard !nums.isEmpty else {
      
      return -1
    }
    
    if nums.last! == target {
      
      return nums.count - 1
    }
    
    let inMin = target < nums.last!

    var i = 0, j = nums.count - 1
    
    if inMin {
      
      var mid = (i + j)/2
      
      while i < j {
        
        if nums[mid] < nums[j] {
          
          if nums[mid] < target {
            
            i = mid + 1
            
            mid = (i + j)/2
          }
          else if nums[mid] > target {
            
            j = mid
            
            mid = (i + j)/2
          }
          else {
            
            return mid
          }
        }
        else if nums[mid] > nums[j] {
          
          i = mid + 1
          
          mid = (i + j)/2
        }
        else {
         
          if nums[mid] == target {
            
            return mid
          }
          
          return -1
        }
      }
    }
    else {
      
      var mid = (i + j)/2
      
      while i < j {
        
        if nums[mid] > nums[i] {
          
          if nums[mid] < target {
            
            i = mid + 1
            
            mid = (i + j)/2
          }
          else if nums[mid] > target {
            
            j = mid
            
            mid = (i + j)/2
          }
          else {
            
            return mid
          }
        }
        else if nums[mid] < nums[i] {
          
          j = mid
          
          mid = (i + j)/2
        }
        else {
          
          if nums[mid] == target {
            
            return mid
          }
          
          return -1
        }
      }
    }
    
    return -1
  }
  
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    guard !matrix.isEmpty && !matrix.first!.isEmpty else {
      
      return false
    }
    
    var i = 0, j = matrix.first!.count - 1
    
    while j >= 0 && i < matrix.count {
      
      if matrix[i][j] > target {
        
        j -= 1
      }
      else if matrix[i][j] < target {
        
        i += 1
      }
      else {
        
        return true
      }
    }
    
    return false
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
  
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
   
    if l1 == nil && l2 == nil {
      
      return nil
    }
    
    if l2 == nil {
      
      return l1
    }
      
    if l1 == nil {
      
      return l2
    }
    
    var a = l1, b = l2
    
    let result = ListNode(a!.val + b!.val)
    
    var current = result
    
    a = a?.next
    
    b = b?.next
    
    while a != nil && b != nil {
      
      current.next = ListNode(a!.val + b!.val)
      
      current = current.next!
      
      a = a?.next
      
      b = b?.next
    }
    
    if a == nil {
      
      current.next = b
    }
    else {
      
      current.next = a
    }
    
    var curr = result
    
    var up = false
    
    while true {
      
      if up {
        
        curr.val += 1
      }
      
      if curr.val >= 10 {
        
        curr.val = curr.val - 10
        
        up = true
      }
      else {
        
        up = false
      }
      
      if curr.next == nil {
        
        break
      }
      
      curr = curr.next!
    }
    
    if up {
      
      curr.next = ListNode(1)
    }
    
    return result
  }
  
  func oddEvenList(_ head: ListNode?) -> ListNode? {
   
    guard head != nil else {
      
      return head
    }
    
    let evenHead = head?.next
    
    var odd = head
    
    var even = odd?.next
    
    var updateodd = true
    
    while odd != nil && even != nil {
      
      if updateodd == true {
        
        if even?.next == nil {
          
          odd?.next = evenHead
          
          return head
        }
        
        odd?.next = even?.next
        
        odd = odd?.next
        
        updateodd = false
      }
      else {
        
        even?.next = odd?.next
        
        even = even?.next
        
        updateodd = true
      }
    }
    
    if even == nil {
      
      odd?.next = evenHead
    }
    
    return head
  }
  
  func postorderTraversal(_ root:TreeNode?) -> [Int] {
    
    guard root != nil else {
      
      return []
    }
    
    var results:[Int] = []
    
    let stack:Stack<TreeNode> = Stack()
    
    var curr = root
    
    var preright:TreeNode?
    
    while curr != nil || !stack.isEmpty() {
      
      while curr != nil {
        
        stack.push(curr!)
        
        curr = curr?.left
      }
      
      curr = stack.peak()
      
      if curr?.right != nil && curr?.right !== preright {
        
        curr = curr?.right
      }
      else {
        
        results.append(curr!.val)
        
        stack.pop()
        
        preright = curr!
        
        curr = nil
      }
    }
    
    return results
  }
  
  func preorderTraversal(_ root:TreeNode?) -> [Int] {
    
    guard root != nil else {
      
      return []
    }
    
    var results:[Int] = []
    
    let stack:Stack<TreeNode> = Stack()
    
    var curr = root
    
    while curr != nil || !stack.isEmpty() {
      
      while curr != nil {
        
        results.append(curr!.val)
        
        stack.push(curr!)
        
        curr = curr?.left
      }
      
      curr = stack.pop()
      
      if curr != nil {
        
        curr = curr?.right
      }
    }
    
    return results
  }

  func inorderTraversal(_ root: TreeNode?) -> [Int] {
   
    guard root != nil else {
      
      return []
    }
    
    var results:[Int] = []
    
    let stack:Stack<TreeNode> = Stack()
    
    var curr = root
    
    while !stack.isEmpty() || curr != nil {
      
      while curr != nil {
        
        stack.push(curr!)
        
        curr = curr?.left
      }
      
      curr = stack.pop()
      
      if curr != nil {
        
        results.append(curr!.val)
        
        curr = curr!.right
      }
    }
    
    return results
  }
  
  func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    
    guard root != nil else {
      
      return []
    }
    
    let left = Stack<TreeNode>()
    
    let right = Stack<TreeNode>()
    
    var curr = root
    
    left.push(curr!)
    
    var results:[[Int]] = []
    
    var arrays:[Int] = []
    
    while !left.isEmpty() || !right.isEmpty() {
      
      while !left.isEmpty() {
        
        curr = left.pop()
        
        arrays.append(curr!.val)
        
        if curr?.left != nil {
          
          right.push(curr!.left!)
        }
        
        if curr?.right != nil {
          
          right.push(curr!.right!)
        }
      }
      
      if !arrays.isEmpty {
        
        results.append(arrays)
      }
      
      arrays.removeAll()
      
      while !right.isEmpty() {
        
        curr = right.pop()
        
        arrays.append(curr!.val)
        
        if curr?.right != nil {
          
          left.push(curr!.right!)
        }
        
        if curr?.left != nil {
          
          left.push(curr!.left!)
        }
      }
      
      if !arrays.isEmpty {
        
        results.append(arrays)
      }
      
      arrays.removeAll()
    }
    
    return results
  }
  
  func buildTree(_ preorder:[Int], _ inorder:[Int]) -> TreeNode? {
    
    guard !preorder.isEmpty else {
      
      return nil
    }
    
    let root = TreeNode(preorder[0])
    
    for i in 0..<inorder.count {
      
      if inorder[i] == preorder[0] {
        
        root.left = buildTree(Array(preorder[1..<1+i]), Array(inorder[0..<i]))
        
        root.right = buildTree(Array(preorder[(i + 1)...]), Array(inorder[(i + 1)...]))
        
        break
      }
    }
    
    return root
  }
  
  func canJump(_ nums: [Int]) -> Bool {
   
    var maxval = 0
    
    for i in 0..<nums.count {
      
      if maxval < i {
        
        return false
      }
      
      maxval = max(i + nums[i], maxval)
      
      if maxval >= nums.count {
        
        return true
      }
    }
    
    return true
  }
  
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
    var paths:[[Int]] = Array(repeating:Array(repeating: 0, count: m), count: n)
    
    for i in 0..<n {
      
      for j in 0..<m {
        
        if i >= 1 && j >= 1 {
          
          paths[i][j] = paths[i - 1][j] + paths[i][j - 1]
        }
        else  {
          
          paths[i][j] = 1
        }
      }
    }
    
    return paths[n - 1][m - 1]
  }
  
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    guard amount > 0 else {
      
      return 0
    }
    
    var dp:[Int] = Array(repeating: amount + 1, count: amount + 1)
    
    dp[0] = 0
    
    for i in 1...amount {
      
      for j in 0..<coins.count {
        
        if coins[j] <= i {
          
          dp[i] = min(dp[i], dp[i - coins[j]] + 1)
        }
      }
    }
    
    return dp[amount] == amount + 1 ? -1 : dp[amount]
  }
  
  func lengthOfLIS(_ nums: [Int]) -> Int {
    
    if nums.isEmpty {
      
      return 0
    }
    
    var dp:[Int] = Array(repeating: 1, count: nums.count)
    
    var result = 1
    
    for i in 1..<nums.count {
      
      for j in 0..<i {
        
        if nums[j] < nums[i] {
          
          dp[i] = max(dp[i], dp[j] + 1)
        }
      }
      
      result = max(result, dp[i])
    }
    
    return result
  }
}
