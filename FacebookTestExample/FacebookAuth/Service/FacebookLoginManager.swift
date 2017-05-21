//
//  FacebookLoginManager.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 19/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

extension LoginManager: FacebookAuthProtocol {}

extension ReadPermission: Equatable {}

// MARK: Equatable
/**
 Method can be used for compare 2 ReadPermission equality.
 - parameter lhs: first ReadPermission object
 - parameter rhs: second ReadPermission object
 */
public func ==(lhs: ReadPermission, rhs: ReadPermission) -> Bool {
  switch (lhs, rhs) {
  case (.email, .email):
    return true
  case (.publicProfile, .publicProfile):
    return true
  case (.userFriends, .userFriends):
    return true
  case (let .custom(permission1), let .custom(permission2)):
    return permission1 == permission2
  default:
    return false
  }
}
