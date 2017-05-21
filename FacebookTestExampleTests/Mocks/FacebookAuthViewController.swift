// MARK: - Mocks generated from file: FacebookTestExample/FacebookAuth/View/FacebookAuthViewController.swift at 2017-05-21 18:58:08 +0000

//
//  FacebookAuthFacebookAuthViewController.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Cuckoo
@testable import FacebookTestExample

import UIKit

class MockFacebookAuthViewController: FacebookAuthViewController, Cuckoo.Mock {
    typealias MocksType = FacebookAuthViewController
    typealias Stubbing = __StubbingProxy_FacebookAuthViewController
    typealias Verification = __VerificationProxy_FacebookAuthViewController
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: FacebookAuthViewController?

    func spy(on victim: FacebookAuthViewController) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "output", "accesibility": "", "@type": "InstanceVariable", "type": "FacebookAuthViewOutput!", "isReadOnly": false]
     override var output: FacebookAuthViewOutput! {
        get {
            return cuckoo_manager.getter("output", original: observed.map { o in return { () -> FacebookAuthViewOutput! in o.output }})
        }
        
        set {
            cuckoo_manager.setter("output", value: newValue, original: observed != nil ? { self.observed?.output = $0 } : nil)
        }
        
    }
    
    // ["name": "setupInitialStateDidCall", "accesibility": "", "@type": "InstanceVariable", "type": "Bool", "isReadOnly": false]
     override var setupInitialStateDidCall: Bool {
        get {
            return cuckoo_manager.getter("setupInitialStateDidCall", original: observed.map { o in return { () -> Bool in o.setupInitialStateDidCall }})
        }
        
        set {
            cuckoo_manager.setter("setupInitialStateDidCall", value: newValue, original: observed != nil ? { self.observed?.setupInitialStateDidCall = $0 } : nil)
        }
        
    }
    
    // ["name": "loginButton", "accesibility": "", "@type": "InstanceVariable", "type": "UIButton!", "isReadOnly": false]
     override var loginButton: UIButton! {
        get {
            return cuckoo_manager.getter("loginButton", original: observed.map { o in return { () -> UIButton! in o.loginButton }})
        }
        
        set {
            cuckoo_manager.setter("loginButton", value: newValue, original: observed != nil ? { self.observed?.loginButton = $0 } : nil)
        }
        
    }
    

    

    
     override func viewDidLoad()  {
        
        return cuckoo_manager.call("viewDidLoad()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.viewDidLoad()
                }
            })
        
    }
    
     override func loginButtonTapped(_ sender: UIButton)  {
        
        return cuckoo_manager.call("loginButtonTapped(_: UIButton)",
            parameters: (sender),
            original: observed.map { o in
                return { (sender: UIButton) in
                    o.loginButtonTapped(sender)
                }
            })
        
    }
    
     override func setupInitialState()  {
        
        return cuckoo_manager.call("setupInitialState()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.setupInitialState()
                }
            })
        
    }
    
     override func showAlert(message: String)  {
        
        return cuckoo_manager.call("showAlert(message: String)",
            parameters: (message),
            original: observed.map { o in
                return { (message: String) in
                    o.showAlert(message: message)
                }
            })
        
    }
    

    struct __StubbingProxy_FacebookAuthViewController: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var output: Cuckoo.ToBeStubbedProperty<FacebookAuthViewOutput?> {
            return .init(manager: cuckoo_manager, name: "output")
        }
        
        var setupInitialStateDidCall: Cuckoo.ToBeStubbedProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "setupInitialStateDidCall")
        }
        
        var loginButton: Cuckoo.ToBeStubbedProperty<UIButton?> {
            return .init(manager: cuckoo_manager, name: "loginButton")
        }
        
        
        func viewDidLoad() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("viewDidLoad()", parameterMatchers: matchers))
        }
        
        func loginButtonTapped<M1: Cuckoo.Matchable>(_ sender: M1) -> Cuckoo.StubNoReturnFunction<(UIButton)> where M1.MatchedType == UIButton {
            let matchers: [Cuckoo.ParameterMatcher<(UIButton)>] = [wrap(matchable: sender) { $0 }]
            return .init(stub: cuckoo_manager.createStub("loginButtonTapped(_: UIButton)", parameterMatchers: matchers))
        }
        
        func setupInitialState() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("setupInitialState()", parameterMatchers: matchers))
        }
        
        func showAlert<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.StubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub("showAlert(message: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_FacebookAuthViewController: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var output: Cuckoo.VerifyProperty<FacebookAuthViewOutput?> {
            return .init(manager: cuckoo_manager, name: "output", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var setupInitialStateDidCall: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "setupInitialStateDidCall", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var loginButton: Cuckoo.VerifyProperty<UIButton?> {
            return .init(manager: cuckoo_manager, name: "loginButton", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func viewDidLoad() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func loginButtonTapped<M1: Cuckoo.Matchable>(_ sender: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == UIButton {
            let matchers: [Cuckoo.ParameterMatcher<(UIButton)>] = [wrap(matchable: sender) { $0 }]
            return cuckoo_manager.verify("loginButtonTapped(_: UIButton)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func setupInitialState() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("setupInitialState()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showAlert<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify("showAlert(message: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class FacebookAuthViewControllerStub: FacebookAuthViewController {
    
     override var output: FacebookAuthViewOutput! {
        get {
            return DefaultValueRegistry.defaultValue(for: (FacebookAuthViewOutput!).self)
        }
        
        set { }
        
    }
    
     override var setupInitialStateDidCall: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
     override var loginButton: UIButton! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIButton!).self)
        }
        
        set { }
        
    }
    

    

    
     override func viewDidLoad()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func loginButtonTapped(_ sender: UIButton)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func setupInitialState()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func showAlert(message: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



