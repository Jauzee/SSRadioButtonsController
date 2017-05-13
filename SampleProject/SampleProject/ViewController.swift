//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 27/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var button1: SSRadioButton!
  @IBOutlet weak var button2: SSRadioButton!
  @IBOutlet weak var button3: SSRadioButton!
  
  var radioButtonController: SSRadioButtonsController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
    radioButtonController?.shouldLetDeselect = true
    radioButtonController?.callback = { button in
      print(button)
    }
  }
  
}
