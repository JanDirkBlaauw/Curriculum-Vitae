//
//  AppDelegate.swift
//  Solicitatie
//
//  Created by Jan Dirk Blaauw on 12/06/2019.
//  Copyright © 2019 JDBPrivate. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
     
    }
    func applicationDidFinishLaunching(_ application: UIApplication) {
        NSLog("Welcome to my official Request to take the job! please take a close look to the code, to the views, the structure, and I would love to hear your view about it! Sincerely, John; AKA Jan Dirk Blaauw")
    }
    func applicationSignificantTimeChange(_ application: UIApplication) {
        NSLog ("I thought you were gone forever! welcome back!")
        
    }
    
}

