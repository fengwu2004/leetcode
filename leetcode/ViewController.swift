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
    
    let solution = Normal()
    
    print(Int32.min)
    
    var d = solution.lengthOfLIS([1,3,6,7,9,4,10,5,6])
    
    print(d)
  }
  
  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
  }

}
