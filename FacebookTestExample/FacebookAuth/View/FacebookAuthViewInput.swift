//
//  FacebookAuthFacebookAuthViewInput.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//
/**
 Protocol to connection presenter -> view
 */
protocol FacebookAuthViewInput: class {

  /**
    Setup initial state of the view. The method will be called when the view is ready.
  */
  func setupInitialState()
  
  /**
   Initialize and show alert with message and cancel button.
   
   - parameter message: String for UIAlertController message
   */
  func showAlert(message: String)
}
