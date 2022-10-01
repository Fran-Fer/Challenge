//
//  AppDelegate.swift
//  UalaTest
//
//  Created by Jorge Gastón Mira on 15/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // MARK: Entry configuration
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    MainRouter().presentMainModule(in: window)

    return true
  }
}


