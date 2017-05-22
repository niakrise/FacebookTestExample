//
//  FacebookTests.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 22/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import XCTest
import Cuckoo
import FacebookCore
import FacebookLogin
@testable import FacebookTestExample

class FacebookTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  /// Returns an equality matcher for ReadPermission
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
  
  /// Returns an equality matcher for UIViewController
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
  
  func testGetAuthToken() {
    let loginManager = MockFacebookAuthProtocol()
    let facebookService = Facebook(manager: loginManager)
    
    var currentResult = LoginResult.cancelled
    stub(loginManager) { stub in
      let vc: UIViewController? = nil
      stub.logIn(equal(to: facebookService.permissions), viewController: equal(to: vc), completion: anyClosure())
        .then { (_, _, completion) -> Void in
          completion?(currentResult)
      }
    }
    
    // Test cancel result
    facebookService.getAuthToken { (token, error) in
      XCTAssertNil(token, "token should be nil")
      XCTAssertNil(error, "error should be nil")
    }
    
    // Test success result
    let authenticationToken = "token"
    let permissions = Set<Permission>(minimumCapacity: 0)
    let token = AccessToken(appId: SDKSettings.appId,
                            authenticationToken: authenticationToken)
    currentResult = LoginResult.success(grantedPermissions: permissions, declinedPermissions: permissions, token:token)
    facebookService.getAuthToken { (token, error) in
      XCTAssertNotNil(token, "token should be not nil")
      XCTAssertEqual(authenticationToken, token, "token should be equal to authenticationToken")
      XCTAssertNil(error, "error should be nil")
    }
    
    // Test failure result
    let originalError = NSError(domain: "facebook", code: 500)
    currentResult = LoginResult.failed(originalError)
    facebookService.getAuthToken { (token, error) in
      XCTAssertNil(token, "token should be nil")
      XCTAssertNotNil(error, "error should be not nil")
      XCTAssertEqual(error!.localizedDescription, originalError.localizedDescription, "error should be equal to originalError")
    }
  }
}
