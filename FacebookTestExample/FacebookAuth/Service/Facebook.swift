//
//  Facebook.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

/**
 Provides methods for getting facebook access token and user data.
 */
public class Facebook {
  
  /**
   Object, which support FacebookAuthProtocol.
   For running it will be FacebookLogin.LoginManager
   For testing it will be MockFacebookAuthProtocol
   */
  var loginManager: FacebookAuthProtocol = LoginManager()
  
  /**
   Read permissions for facebook authorization
   */
  var permissions: [FacebookCore.ReadPermission] = [.publicProfile, .email]
  
  /**
   Get facebook access token by opening a login window.
   
   - parameter completion: When authorization will be complete, returns object LoginResult
   */
  public func getAuthToken(completion: @escaping (LoginResult) -> Void) {
    loginManager.logIn(permissions, viewController: nil, completion: completion)
  }
}
