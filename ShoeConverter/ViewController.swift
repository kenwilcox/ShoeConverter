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
  @IBOutlet weak var sexSwitch: UISwitch!
  @IBOutlet weak var conversionLabel: UILabel!
  
  let usEuroMenDiff = 33.0
  let usEuroWomenDiff = 30.5
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func calculateMensShoeSize(euro: Bool) {
    if euro {
      let euroShoeSizeString = euroShoeSizeTextField.text
      if (countElements(euroShoeSizeString) > 0) {
        //let euroShoeSize = euroShoeSizeString.toInt()!
        let euroShoeSize = NSString(string: euroShoeSizeString).doubleValue;
        if (euroShoeSize > usEuroMenDiff) {
          usShoeSizeTextField.text = "\(euroShoeSize - usEuroMenDiff)"
        } else {
          usShoeSizeTextField.text = ""
        }
      }
    } else {
      let usShoeSizeString = usShoeSizeTextField.text
      if (countElements(usShoeSizeString) > 0) {
        //let usShoeSize = usShoeSizeString.toInt()!
        let usShoeSize = NSString(string: usShoeSizeString).doubleValue;
        euroShoeSizeTextField.text = "\(usShoeSize + usEuroMenDiff)"
      } else {
        euroShoeSizeTextField.text = ""
      }
    }
  }
  
  func calculateWomensShoeSize(euro: Bool) {
    if euro {
      let euroShoeSizeString = euroShoeSizeTextField.text
      if (countElements(euroShoeSizeString) > 0) {
        let euroShoeSize = NSString(string: euroShoeSizeString).doubleValue;
        if (euroShoeSize > usEuroWomenDiff) {
          usShoeSizeTextField.text = "\(euroShoeSize - usEuroWomenDiff)"
        } else {
          usShoeSizeTextField.text = ""
        }
      }
    } else {
      let usShoeSizeString = usShoeSizeTextField.text
      if (countElements(usShoeSizeString) > 0) {
        let usShoeSize = NSString(string: usShoeSizeString).doubleValue;
        euroShoeSizeTextField.text = "\(usShoeSize + usEuroWomenDiff)"
      } else {
        euroShoeSizeTextField.text = ""
      }
    }
  }
  
  @IBAction func sexSwitchValueChange(sender: UISwitch) {
    if sexSwitch.on {
      usShoeSizeTextField.placeholder = "US Womens Shoe Size"
      euroShoeSizeTextField.placeholder = "Euro Womens Shoe Size"
      conversionLabel.text = "Womens Shoes"
      calculateWomensShoeSize(true)
    } else {
      usShoeSizeTextField.placeholder = "US Mens Shoe Size"
      euroShoeSizeTextField.placeholder = "Euro Mens Shoe Size"
      conversionLabel.text = "Mens Shoes"
      calculateMensShoeSize(true)
    }
  }

  
  @IBAction func usShoeSizeEditingChanged(sender: UITextField) {
    if sexSwitch.on {
      calculateWomensShoeSize(false)
    } else {
      calculateMensShoeSize(false)
    }
  }
  
  @IBAction func euroShoeSizeEditingChanged(sender: UITextField) {
    if sexSwitch.on {
      calculateWomensShoeSize(true)
    } else {
      calculateMensShoeSize(true)
    }
  }
  
}

