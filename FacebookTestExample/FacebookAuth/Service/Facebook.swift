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
  private(set) var loginManager: FacebookAuthProtocol
  
  /**
   Read permissions for facebook authorization
   */
  private(set) var permissions: Array<FacebookCore.ReadPermission>
  
  init(manager: FacebookAuthProtocol = LoginManager(), readPermissions: [FacebookCore.ReadPermission] = [.publicProfile, .email]) {
    loginManager = manager
    permissions = readPermissions
  }
  
  /**
   Get facebook access token by opening a login window.
   
   - parameter completion: When authorization will be complete, returns object LoginResult
   */
  public func getAuthToken(completion: @escaping (String?, Error?) -> Void) {
    loginManager.logIn(permissions, viewController: nil) { result in
      switch result {
      case .success(_, _, let accessToken):
        completion(accessToken.authenticationToken, nil)
      case .cancelled:
        completion(nil, nil)
      case .failed(let error):
        completion(nil, error)
      }
    }
  }
}
