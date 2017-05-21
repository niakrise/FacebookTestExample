//
//  FacebookAuthFacebookAuthConfiguratorTests.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import XCTest
@testable import FacebookTestExample

class FacebookAuthModuleConfiguratorTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testConfigureModuleForViewController() {

    //given
    let viewController = MockFacebookAuthViewController().spy(on: FacebookAuthViewController())
    let assembly = FacebookAuthModuleAssembly()

    //when
    assembly.configureModuleForViewInput(viewInput: viewController)

    //then
    XCTAssertNotNil(viewController.output, "output in FacebookAuthViewController is nil after configuration")
    XCTAssertTrue(viewController.output is FacebookAuthPresenter, "output is not FacebookAuthPresenter")

    let presenter: FacebookAuthPresenter = viewController.output as! FacebookAuthPresenter
    XCTAssertNotNil(presenter.view, "view in FacebookAuthPresenter is nil after configuration")
    XCTAssertNotNil(presenter.facebookService, "facebookService in FacebookAuthPresenter is nil after configuration")
  }
}
