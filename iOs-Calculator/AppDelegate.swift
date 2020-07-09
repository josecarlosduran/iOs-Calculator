//
//  AppDelegate.swift
//  iOs-Calculator
//
//  Created by Jose Carlos Duran on 09/07/2020.
//  Copyright © 2020 Jose Carlos Duran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        setupView();
        return true
    }
    
    // MARK: - Private methods
    
    private func setupView(){
        window = UIWindow(frame : UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        
    }

    


}

