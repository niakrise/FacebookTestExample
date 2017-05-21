//
//  FacebookAuthFacebookAuthViewController.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import UIKit

/**
 ViewController for module FacebookAuth
 */
class FacebookAuthViewController: UIViewController, FacebookAuthViewInput {

  /**
   Reference to presenter
   */
  var output: FacebookAuthViewOutput!
  
  /**
   Variable for testing. While we don't need configure something, when module was initialized and ready for work. 
   We use this flag to verify that the method setupInitialState() was called.
   */
  var setupInitialStateDidCall: Bool = false

  @IBOutlet weak var loginButton: UIButton!
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewIsReady()
  }
  
  // MARK: Actions
  /**
   Action for login button.
   
   - parameter sender: UIButton object
   */
  @IBAction func loginButtonTapped(_ sender: UIButton) {
    output.loginViaFacebook()
  }

  // MARK: FacebookAuthViewInput Methods
  
  func setupInitialState() {
    setupInitialStateDidCall = true
  }
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: nil,
                                  message: message,
                                  preferredStyle: .alert)
    let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(cancel)
    self.present(alert, animated: true, completion: nil)
  }
}
