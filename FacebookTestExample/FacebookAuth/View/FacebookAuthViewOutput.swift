//
//  FacebookAuthFacebookAuthViewOutput.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//
/**
 Protocol to connection view -> presenter
 */
protocol FacebookAuthViewOutput: class {

  /**
    Notify presenter that view is ready
  */
  func viewIsReady()
  
  /**
   Notify presenter that user clicked on login button
   */
  func loginViaFacebook()
}
