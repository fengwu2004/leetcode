//
//  ViewController.swift
//  leetcode
//
//  Created by ky on 2018/8/26.
//  Copyright © 2018 yellfun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let solution = WordSearch()
    
    let board:[[Character]] =
      [
        ["A","B","C","E"],
        ["S","F","C","S"],
        ["A","D","E","E"]
    ]
    
    print(solution.exist(board, "ABCCED"))
  }
  
  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
  }
}
