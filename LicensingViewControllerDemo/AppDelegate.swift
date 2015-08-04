//
//  AppDelegate.swift
//  LicensingViewControllerDemo
//
//  Created by Tiago Henriques on 04/08/15.
//  Copyright © 2015 Tiago Henriques. All rights reserved.
//

import LicensingViewController
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let alamofireItem = LicensingItem(
            title: "Alamofire",
            license: License.MIT(owner: "Alamofire Software Foundation (http://alamofire.org/)", years: "2014")
        )

        let caniveteItem = LicensingItem(
            title: "Canivete",
            license: License.MIT(owner: "Tiago Henriques (http://tiagomnh.com)", years: "2015")
        )

        let kingfisherItem = LicensingItem(
            title: "Kingfisher",
            license: License.MIT(owner: "Wei Wang", years: "2015")
        )

        let licensingViewController = LicensingViewController()
        licensingViewController.title = "Acknowledgments"
        licensingViewController.items = [alamofireItem, caniveteItem, kingfisherItem]
        licensingViewController.titleColor = UIButton().tintColor!

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = UINavigationController(rootViewController: licensingViewController)
        
        return true
    }
    
}

