//
//  AppDelegate.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //let mainController = RepoViewController(resource: Repo.all)
        let mainController = GenericViewController(resource: Repo.all, title: "Repos")
        let navController = UINavigationController(rootViewController: mainController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}
