// MARK: - Mocks generated from file: FacebookTestExample/FacebookAuth/Presenter/FacebookAuthPresenter.swift at 2017-05-21 18:58:08 +0000

//
//  FacebookAuthFacebookAuthPresenter.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import Cuckoo
@testable import FacebookTestExample

class MockFacebookAuthPresenter: FacebookAuthPresenter, Cuckoo.Mock {
    typealias MocksType = FacebookAuthPresenter
    typealias Stubbing = __StubbingProxy_FacebookAuthPresenter
    typealias Verification = __VerificationProxy_FacebookAuthPresenter
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: FacebookAuthPresenter?

    func spy(on victim: FacebookAuthPresenter) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "FacebookAuthViewInput!", "isReadOnly": false]
     override var view: FacebookAuthViewInput! {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> FacebookAuthViewInput! in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "facebookService", "accesibility": "", "@type": "InstanceVariable", "type": "Facebook!", "isReadOnly": false]
     override var facebookService: Facebook! {
        get {
            return cuckoo_manager.getter("facebookService", original: observed.map { o in return { () -> Facebook! in o.facebookService }})
        }
        
        set {
            cuckoo_manager.setter("facebookService", value: newValue, original: observed != nil ? { self.observed?.facebookService = $0 } : nil)
        }
        
    }
    

    

    
     override func viewIsReady()  {
        
        return cuckoo_manager.call("viewIsReady()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.viewIsReady()
                }
            })
        
    }
    
     override func loginViaFacebook()  {
        
        return cuckoo_manager.call("loginViaFacebook()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.loginViaFacebook()
                }
            })
        
    }
    

    struct __StubbingProxy_FacebookAuthPresenter: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<FacebookAuthViewInput?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var facebookService: Cuckoo.ToBeStubbedProperty<Facebook?> {
            return .init(manager: cuckoo_manager, name: "facebookService")
        }
        
        
        func viewIsReady() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("viewIsReady()", parameterMatchers: matchers))
        }
        
        func loginViaFacebook() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("loginViaFacebook()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_FacebookAuthPresenter: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<FacebookAuthViewInput?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var facebookService: Cuckoo.VerifyProperty<Facebook?> {
            return .init(manager: cuckoo_manager, name: "facebookService", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func viewIsReady() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("viewIsReady()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func loginViaFacebook() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("loginViaFacebook()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class FacebookAuthPresenterStub: FacebookAuthPresenter {
    
     override var view: FacebookAuthViewInput! {
        get {
            return DefaultValueRegistry.defaultValue(for: (FacebookAuthViewInput!).self)
        }
        
        set { }
        
    }
    
     override var facebookService: Facebook! {
        get {
            return DefaultValueRegistry.defaultValue(for: (Facebook!).self)
        }
        
        set { }
        
    }
    

    

    
     override func viewIsReady()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func loginViaFacebook()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



