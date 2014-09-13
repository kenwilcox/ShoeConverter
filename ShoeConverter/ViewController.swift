//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Kenneth Wilcox on 9/13/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var usShoeSizeTextField: UITextField!
  @IBOutlet weak var euroShoeSizeTextField: UITextField!
  
  let usEuroDiff = 33
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func usShoeSizeEditingChanged(sender: UITextField) {
    let usShoeSizeString = usShoeSizeTextField.text
    if (countElements(usShoeSizeString) > 0) {
      let usShoeSize = usShoeSizeString.toInt()!
      euroShoeSizeTextField.text = "\(usShoeSize + usEuroDiff)"
    } else {
      euroShoeSizeTextField.text = ""
    }
    
  }
  
  @IBAction func euroShoeSizeEditingChanged(sender: UITextField) {
    let euroShoeSizeString = euroShoeSizeTextField.text
    if (countElements(euroShoeSizeString) > 0) {
      let euroShoeSize = euroShoeSizeString.toInt()!
      if (euroShoeSize > usEuroDiff) {
        usShoeSizeTextField.text = "\(euroShoeSize - usEuroDiff)"
      } else {
        usShoeSizeTextField.text = ""
      }
    }
    
  }
  
}

