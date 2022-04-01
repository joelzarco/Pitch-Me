//
//  AppDelegate.swift
//  PitchMe-Parfait
//  Refactored version of Udacity's free iOS course app PitchMe Perfect
//  Created by Johel Zarco on 30/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application : UIApplication, didFinishLaunchingWithOptions launchOptions : [UIApplication.LaunchOptionsKey : Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .secondarySystemBackground
//        window?.rootViewController = RecordViewController()
        window?.rootViewController = EditAudioViewController()
        return true
    }
}

