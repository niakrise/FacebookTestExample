//
//  FacebookAuthFacebookAuthAssembly.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import UIKit

/**
 Assembly for module FacebookAuth
 */
class FacebookAuthModuleAssembly {

  /**
   Method for calling the module configurator, based on UIViewController
   - parameter viewInput: viewController for which it is necessary to establish connections between parts of the module
   */
  func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
    if let viewController = viewInput as? FacebookAuthViewController {
        configure(viewController: viewController)
    }
  }

  /**
   Configurator, to set the dependencies between module components
   - parameter viewController: instance of class FacebookAuthViewController
   */
  private func configure(viewController: FacebookAuthViewController) {

    let presenter = FacebookAuthPresenter()
    presenter.view = viewController
    presenter.facebookService = Facebook()

    viewController.output = presenter
  }

}
