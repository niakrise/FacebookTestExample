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
    facebookService.getAuthToken { [weak self] (result) in
      var message = ""
      switch result {
      case .success(_, _, let accessToken):
        message = String(format: FacebookAuthPresenter.kSuccess, accessToken.authenticationToken)
      case .cancelled:
        message = FacebookAuthPresenter.kCancelled
      case .failed(let error):
        message = String(format: FacebookAuthPresenter.kFailed, error.localizedDescription)
      }
      self?.view.showAlert(message: message)
    }
  }
}

