//
//  FacebookAuthFacebookAuthPresenter.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

/**
 Presenter for module FacebookAuth
 */
class FacebookAuthPresenter: FacebookAuthViewOutput {

  /**
   Reference to viewController
   */
  weak var view: FacebookAuthViewInput!
  
  /**
   Reference to facebook service
   */
  var facebookService: Facebook!

  /**
   Template for message, when authorization was completed successfully.
   */
  static let kSuccess = "Auth was completed successfully. AccessToken: %@"
  /**
   Template for message, when authorization was cancelled.
   */
  static let kCancelled = "Auth was cancelled."
  /**
   Template for message, When authorization was completed with an error.
   */
  static let kFailed = "Auth error: %@"
  
  func viewIsReady() {
    view.setupInitialState()
  }
  
  func loginViaFacebook() {
    facebookService.getAuthToken { [weak self] (token, error) in
      var message = ""
      if let error = error {
        message = String(format: FacebookAuthPresenter.kFailed, error.localizedDescription)
      } else {
        if let token = token {
          message = String(format: FacebookAuthPresenter.kSuccess, token)
        } else {
          message = FacebookAuthPresenter.kCancelled
        }
      }
      self?.view.showAlert(message: message)
    }
  }
}

