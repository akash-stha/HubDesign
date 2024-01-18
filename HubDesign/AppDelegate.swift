//
//  AppDelegate.swift
//  HubDesign
//
//  Created by Newarpunk on 5/28/21.
//  Copyright © 2021 Akash Stha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 3.0))
        return true
    }

}

