//
//  FacebookAuthFacebookAuthStoryboardAssembly.swift
//  FacebookTestExample
//
//  Created by Zoia Pribytkova on 15/05/2017.
//  Copyright © 2017 Zoia Pribytkova. All rights reserved.
//

import UIKit

/**
 Storyboard assembly for module FacebookAuth
 */
class FacebookAuthModuleStoryboardAssembly: NSObject {

  //Connect with object on storyboard
  @IBOutlet weak var viewController: FacebookAuthViewController!

  override func awakeFromNib() {
    let assembly = FacebookAuthModuleAssembly()
    assembly.configureModuleForViewInput(viewInput: viewController)
  }

}
