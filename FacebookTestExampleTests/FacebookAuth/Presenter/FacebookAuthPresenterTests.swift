//
//  FacebookAuthFacebookAuthPresenterTests.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import XCTest
import Cuckoo
@testable import FacebookTestExample

class FacebookAuthPresenterTest: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }
  
  func testLoginViaFacebook() {
    let viewController = MockFacebookAuthViewController().spy(on: FacebookAuthViewController())
    let assembly = FacebookAuthModuleAssembly()
    assembly.configureModuleForViewInput(viewInput: viewController)
    let presenter = viewController.output as! FacebookAuthPresenter
    let facebookService = MockFacebook()
    
    // replace facebook service to mock
    presenter.facebookService = facebookService
    
    stub(viewController) { stub in
      stub.showAlert(message: anyString()).then { (_) -> Void in }
    }
    
    var token: String? = nil
    var error: Error? = nil
    stub(facebookService) { stub in
      stub.getAuthToken(completion: anyClosure()).then { completion in
        completion(token, error)
      }
    }
    
    let messageCaptor = ArgumentCaptor<String>()
    
    // Test cancel result
    presenter.loginViaFacebook()
    verify(viewController, times(1)).showAlert(message: messageCaptor.capture())
    XCTAssertEqual(messageCaptor.value, FacebookAuthPresenter.kCancelled, "wrong message")
    
    // Test success result
    token = "token"
    error = nil
    presenter.loginViaFacebook()
    verify(viewController, times(2)).showAlert(message: messageCaptor.capture())
    XCTAssertEqual(messageCaptor.value, String(format: FacebookAuthPresenter.kSuccess, token!), "wrong message")
    
    // Test failure result
    token = nil
    error = NSError(domain: "facebook", code: 500)
    presenter.loginViaFacebook()
    verify(viewController, times(3)).showAlert(message: messageCaptor.capture())
    XCTAssertEqual(messageCaptor.value, String(format: FacebookAuthPresenter.kFailed, error!.localizedDescription), "wrong message")
  }
}
