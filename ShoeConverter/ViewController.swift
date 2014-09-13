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
  @IBOutlet weak var usStepper: UIStepper!
  @IBOutlet weak var euroStepper: UIStepper!
  
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

  func calculate(euro:Bool) {
    if sexSwitch.on {
      calculateWomensShoeSize(euro)
    } else {
      calculateMensShoeSize(euro)
    }
  }
  
  func calculateMensShoeSize(euro: Bool) {
    if euro {
      let euroShoeSizeString = euroShoeSizeTextField.text
      if (countElements(euroShoeSizeString) > 0) {
        let euroShoeSize = NSString(string: euroShoeSizeString).doubleValue;
        euroStepper.value = euroShoeSize
        if (euroShoeSize > usEuroMenDiff) {
          usShoeSizeTextField.text = "\(euroShoeSize - usEuroMenDiff)"
        } else {
          usShoeSizeTextField.text = ""
        }
      }
    } else {
      let usShoeSizeString = usShoeSizeTextField.text
      if (countElements(usShoeSizeString) > 0) {
        let usShoeSize = NSString(string: usShoeSizeString).doubleValue;
        usStepper.value = usShoeSize
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
        euroStepper.value = euroShoeSize
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
        usStepper.value = usShoeSize
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
    calculate(false)
  }
  
  @IBAction func euroShoeSizeEditingChanged(sender: UITextField) {
    calculate(true)
  }
  
  @IBAction func usStepperValueChanged(sender: UIStepper) {
    let usValue = sender.value
    usShoeSizeTextField.text = "\(usValue)"
    calculate(false)
  }
  
  @IBAction func euroStepperValueChanged(sender: UIStepper) {
    let euroValue = sender.value
    euroShoeSizeTextField.text = "\(euroValue)"
    calculate(true)
  }
  
}

