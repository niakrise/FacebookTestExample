//
//  FacebookAuthFacebookAuthViewTests.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import XCTest
import Cuckoo
@testable import FacebookTestExample

class FacebookAuthViewTests: XCTestCase {
  
  var viewController: FacebookAuthViewController!
  var presenterMock: MockFacebookAuthPresenter!

  override func setUp() {
    super.setUp()
    // configure module
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    viewController = storyboard.instantiateViewController(withIdentifier: "FacebookAuthViewControllerID") as! FacebookAuthViewController
    
    // replace presenter to mock
    presenterMock = MockFacebookAuthPresenter().spy(on: viewController.output as! FacebookAuthPresenter)
    viewController.output = presenterMock
    presenterMock.view = viewController
    
    // emulate the module display and start the life cycle
    UIApplication.shared.keyWindow?.rootViewController = viewController
    let _ = viewController.view
  }

  override func tearDown() {
    super.tearDown()
  }
  
  func testViewIsReady() {
    XCTAssertTrue(viewController.setupInitialStateDidCall, "view not ready")
  }
  
  func testLoginButtonIsEnabled() {
    XCTAssertTrue(viewController.loginButton.isEnabled, "login button disabled")
  }
  
  func testLoginButtonTap() {
    if let actions = viewController.loginButton.actions(forTarget: viewController, forControlEvent: .touchUpInside) {
      XCTAssertTrue(actions.contains("loginButtonTapped:"), "login button have wrong action")
      
      var loginViaFacebookDidCall = false
      stub(presenterMock) { stub in
        stub.loginViaFacebook().then {
          loginViaFacebookDidCall = true
        }
      }
      
      viewController.loginButtonTapped(viewController.loginButton)
      XCTAssertTrue(loginViaFacebookDidCall, "presenter method loginViaFacebook was not called")
    } else {
      XCTFail("login button don't have action for touchUpInside")
    }
  }
  
  func testAlert() {
    let message = "Alert"
    viewController.showAlert(message: message)
    
    XCTAssertTrue(viewController.presentedViewController is UIAlertController, "Unknown alert type. Type must be UIAlertController")
    let alertController = viewController.presentedViewController as! UIAlertController
    XCTAssertEqual(alertController.message, message, "Incoming and outgoing messages don't match")
  }
  
}
