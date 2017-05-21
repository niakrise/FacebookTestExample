// MARK: - Mocks generated from file: FacebookTestExample/FacebookAuth/Service/FacebookAuthProtocol.swift at 2017-05-21 18:58:08 +0000

//
//  FacebookAuthProtocol.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 19/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Cuckoo
@testable import FacebookTestExample

import FacebookCore
import FacebookLogin
import Foundation

class MockFacebookAuthProtocol: FacebookAuthProtocol, Cuckoo.Mock {
    typealias MocksType = FacebookAuthProtocol
    typealias Stubbing = __StubbingProxy_FacebookAuthProtocol
    typealias Verification = __VerificationProxy_FacebookAuthProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: FacebookAuthProtocol?

    func spy(on victim: FacebookAuthProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func logIn(_ permissions: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)  {
        
        return cuckoo_manager.call("logIn(_: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)",
            parameters: (permissions, viewController, completion),
            original: observed.map { o in
                return { (permissions: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?) in
                    o.logIn(permissions, viewController: viewController, completion: completion)
                }
            })
        
    }
    

    struct __StubbingProxy_FacebookAuthProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func logIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ permissions: M1, viewController: M2, completion: M3) -> Cuckoo.StubNoReturnFunction<([FacebookCore.ReadPermission], UIViewController?, ((FacebookLogin.LoginResult) -> Swift.Void)?)> where M1.MatchedType == [FacebookCore.ReadPermission], M2.MatchedType == UIViewController?, M3.MatchedType == ((FacebookLogin.LoginResult) -> Swift.Void)? {
            let matchers: [Cuckoo.ParameterMatcher<([FacebookCore.ReadPermission], UIViewController?, ((FacebookLogin.LoginResult) -> Swift.Void)?)>] = [wrap(matchable: permissions) { $0.0 }, wrap(matchable: viewController) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub("logIn(_: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_FacebookAuthProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func logIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ permissions: M1, viewController: M2, completion: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [FacebookCore.ReadPermission], M2.MatchedType == UIViewController?, M3.MatchedType == ((FacebookLogin.LoginResult) -> Swift.Void)? {
            let matchers: [Cuckoo.ParameterMatcher<([FacebookCore.ReadPermission], UIViewController?, ((FacebookLogin.LoginResult) -> Swift.Void)?)>] = [wrap(matchable: permissions) { $0.0 }, wrap(matchable: viewController) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify("logIn(_: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class FacebookAuthProtocolStub: FacebookAuthProtocol {
    

    

    
     func logIn(_ permissions: [FacebookCore.ReadPermission], viewController: UIViewController?, completion: ((FacebookLogin.LoginResult) -> Swift.Void)?)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



