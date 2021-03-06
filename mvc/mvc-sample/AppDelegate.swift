//
//  AppDelegate.swift
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let repoController = MainViewController(repoHandler: RepoHandler())
        let navController = UINavigationController(rootViewController: repoController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

