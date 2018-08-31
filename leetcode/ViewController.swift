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
    
    let p = solution.partition("aab")
    
    print(p)
  }
  
  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
  }

}
