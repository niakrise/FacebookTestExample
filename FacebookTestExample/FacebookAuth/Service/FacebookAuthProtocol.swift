//
//  FacebookAuthProtocol.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 19/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

/**
 Protocol for mocking method logIn inside class FacebookLogin.LoginManager
 */
protocol FacebookAuthProtocol {
  
  /**
   Logs the user in or authorizes additional permissions.
   
   Use this method when asking for read permissions. You should only ask for permissions when they
   are needed and explain the value to the user. You can inspect the `declinedPermissions` in the result to also
   provide more information to the user if they decline permissions.
   
   This method will present UI the user. You typically should check if `AccessToken.current` already
   contains the permissions you need before asking to reduce unnecessary app switching.
   
   - parameter permissions:    Array of read permissions. Default: `[.PublicProfile]`
   - parameter viewController: Optional view controller to present from. Default: topmost view controller.
   - parameter completion:     Optional callback.
   */
  func logIn(_ permissions: [FacebookCore.ReadPermission],
             viewController: UIViewController?,
             completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)
}
