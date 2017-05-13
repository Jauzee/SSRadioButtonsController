//
//  RadioButtonsController.swift
//  TestApp
//
//  Created by Al Shamas Tufail on 24/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit


class SSRadioButtonsController {
  
  var buttonsArray: [UIButton] = []
  
  typealias SSRadioCallback = ((UIButton?) -> Void)
  var callback: SSRadioCallback?
  
  /**
   Set whether a selected radio button can be deselected or not. Default value is false.
   */
  var shouldLetDeselect = false
  
  /**
   Variadic parameter init that accepts UIButtons.
   
   - parameter buttons: Buttons that should behave as Radio Buttons
   */
  init(buttons: UIButton...) {
    buttonsArray = buttons
    for button in buttonsArray {
      button.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: .touchUpInside)
    }
  }
  
  /**
   Add a UIButton to Controller
   
   - parameter button: Add the button to controller.
   */
  func add(button: UIButton) {
    buttonsArray.append(button)
    button.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: .touchUpInside)
  }
  
  /**
   Remove a UIButton from controller.
   
   - parameter button: Button to be removed from controller.
   */
  func remove(button: UIButton) {
    var iteratingButton: UIButton?
    if buttonsArray.contains(button) {
      iteratingButton = button
    }
    guard let button = iteratingButton, let index = buttonsArray.index(of: button) else { return }
    buttonsArray.remove(at: index)
    button.removeTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: .touchUpInside)
    button.isSelected = false
  }
  
  /**
   Set an array of UIButons to behave as controller.
   
   - parameter buttonArray: Array of buttons
   */
  func set(buttonsArray: [UIButton]) {
    for button in buttonsArray {
      button.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: .touchUpInside)
    }
    self.buttonsArray = buttonsArray
  }
  
  @objc func pressed(_ sender: UIButton) {
    var currentSelectedButton: UIButton?
    if sender.isSelected {
      if shouldLetDeselect {
        sender.isSelected = false
        currentSelectedButton = nil
      }
    } else {
      for button in self.buttonsArray where button.isSelected {
        button.isSelected = false
      }
      sender.isSelected = true
      currentSelectedButton = sender
    }
    callback?(currentSelectedButton)
  }
  
  /**
   Get the currently selected button.
   
   - returns: Currenlty selected button.
   */
  var selectedButton: UIButton? {
    guard let index = buttonsArray.index(where: { $0.isSelected }) else {
      return nil
    }
    return buttonsArray[index]
  }
  
}
