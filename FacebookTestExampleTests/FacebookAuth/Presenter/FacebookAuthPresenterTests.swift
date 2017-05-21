//
//  FacebookAuthFacebookAuthPresenterTests.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import XCTest
import Cuckoo
import FacebookCore
import FacebookLogin
@testable import FacebookTestExample

class FacebookAuthPresenterTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func equal(to value: [ReadPermission]) -> ParameterMatcher<[ReadPermission]> {
    return ParameterMatcher { tested in
      if value.count != tested.count {
        return false
      }
      for element in value {
        if !tested.contains(element) {
          return false
        }
      }
      return true
    }
  }
  
  func equal(to value: UIViewController?) -> ParameterMatcher<UIViewController?> {
    return ParameterMatcher { tested in
      if value == nil && tested == nil {
        return true
      }
      if value != nil && tested != nil {
        return value!.hash == tested!.hash
      }
      return false
    }
  }
  
  func testPermissionEquatable() {
    let emailPermission = ReadPermission.email
    let publicProfilePermission = ReadPermission.publicProfile
    let userFriendsPermission = ReadPermission.userFriends
    let customPermission1 = ReadPermission.custom("first permission")
    let customPermission2 = ReadPermission.custom("second permission")
    
    XCTAssertEqual(emailPermission, emailPermission)
    XCTAssertNotEqual(emailPermission, publicProfilePermission)
    XCTAssertNotEqual(emailPermission, userFriendsPermission)
    XCTAssertNotEqual(emailPermission, customPermission1)
    XCTAssertNotEqual(emailPermission, customPermission2)
    
    XCTAssertEqual(publicProfilePermission, publicProfilePermission)
    XCTAssertNotEqual(publicProfilePermission, userFriendsPermission)
    XCTAssertNotEqual(publicProfilePermission, customPermission1)
    XCTAssertNotEqual(publicProfilePermission, customPermission2)
    
    XCTAssertEqual(userFriendsPermission, userFriendsPermission)
    XCTAssertNotEqual(userFriendsPermission, customPermission1)
    XCTAssertNotEqual(userFriendsPermission, customPermission2)
    
    XCTAssertEqual(customPermission1, customPermission1)
    XCTAssertEqual(customPermission2, customPermission2)
    XCTAssertNotEqual(customPermission1, customPermission2)
  }
  
  func testLoginViaFacebook() {
    let viewController = MockFacebookAuthViewController().spy(on: FacebookAuthViewController())
    let assembly = FacebookAuthModuleAssembly()
    assembly.configureModuleForViewInput(viewInput: viewController)
    let presenter = viewController.output as! FacebookAuthPresenter
    let loginManager = MockFacebookAuthProtocol()
    presenter.facebookService.loginManager = loginManager
    
    var currentResult = LoginResult.cancelled
    var currentMessage = ""
    stub(viewController) { stub in
      stub.showAlert(message: anyString()).then { (message) -> Void in
        currentMessage = message
      }
    }
    stub(loginManager) { stub in
      let vc: UIViewController? = nil
      stub.logIn(equal(to: presenter.facebookService.permissions), viewController: equal(to: vc), completion: anyClosure())
        .then { (_, _, completion) -> Void in
        completion?(currentResult)
      }
    }
    
    // Test cancel result
    presenter.loginViaFacebook()
    XCTAssertEqual(currentMessage, FacebookAuthPresenter.kCancelled, "wrong message")
    
    // Test success result
    let authenticationToken = "token"
    let permissions = Set<Permission>(minimumCapacity: 0)
    let token = AccessToken(appId: SDKSettings.appId,
                            authenticationToken: authenticationToken)
    currentResult = LoginResult.success(grantedPermissions: permissions, declinedPermissions: permissions, token:token)
    presenter.loginViaFacebook()
    XCTAssertEqual(currentMessage, String(format: FacebookAuthPresenter.kSuccess, token.authenticationToken), "wrong message")
    
    // Test failure result
    let error = NSError(domain: "facebook", code: 500)
    currentResult = LoginResult.failed(error)
    presenter.loginViaFacebook()
    XCTAssertEqual(currentMessage, String(format: FacebookAuthPresenter.kFailed, error.localizedDescription), "wrong message")
  }
}
