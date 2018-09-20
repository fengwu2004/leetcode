//
//  LinkList.cpp
//  leetcode
//
//  Created by ky on 2018/9/7.
//  Copyright © 2018 yellfun. All rights reserved.
//

#include <stdio.h>
#include <math.h>

struct ListNode {
  
  int val;
  
  ListNode *next;
  
  ListNode(int x): val(x), next(NULL) {}
};

struct TreeLinkNode {
  
  int val;
  
  TreeLinkNode *left, *right, *next;
  
  TreeLinkNode(int x):val(x), left(NULL), right(NULL), next(NULL) {}
};

class Solutions {
  
public:
  
  void connect(TreeLinkNode *root) {
    
    if (!root) {
      
      return;
    }
    
    if (root->left) {
      
      root->left->next = root->right;
    }
    
    if (root->right && root->next) {
      
      root->right->next = root->next->left;
    }
    
    connect(root->left);
    
    connect(root->right);
  }
  
  void deleteNode(ListNode *node) {
    
    ListNode *next = node->next;
    
    node->val = next->val;
    
    node->next = next->next;
  }
  
  ListNode* removeNthFromEnd(ListNode* head, int n) {
    
    if (n == 0) {
      
      return head;
    }
    
    ListNode *end = head;
    
    ListNode *cur = head;
    
    while (n > 0) {
      
      end = end->next;
      
      --n;
    }
    
    if (!end) {
      
      return head->next;
    }
    
    while (end->next) {
      
      end = end->next;
      
      cur = cur->next;
    }
    
    cur->next = cur->next->next;
    
    return head;
  }
  
  bool hasCycle(ListNode *head) {
   
    ListNode *slow = head;
    
    ListNode *fast = head;
    
    while (fast != NULL && fast->next != NULL && fast->next->next != NULL) {
      
      slow = slow->next;
      
      fast = fast->next->next;
      
      if (fast == slow)  {
        
        return true;
      }
    }
    
    return false;
  }
};

bool isBadVersion(int version);

class Solution {
  
public:
  int firstBadVersion(int n) {
  
    long i = 1, j = n;
    
    long mid = (i + j) >> 1;
    
    while (i < j) {
      
      if (isBadVersion(mid)) {
        
        j = mid;
      }
      else {
        
        i = mid + 1;
      }
      
      mid = (i + j) >> 1;
    }
    
    return i;
  }
};

ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
  
  ListNode *currA = headA;
  
  ListNode *currB = headB;
  
  if (!headB || !headA) {
    
    return NULL;
  }
  
  while (currA != currB) {
    
    if (currA) {
      
      currA = currA->next;
    }
    else {
      
      currA = headB;
    }
    
    if (currB) {
      
      currB = currB->next;
    }
    else {
      
      currB = headA;
    }
  }
  
  return currA;
}
