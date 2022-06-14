//
//  AppDelegate.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tapBarController = UITabBarController()
        
        let firstViewController = DefaultViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), tag: 0)
        
        let secondViewController = DefaultViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), tag: 1)
        
        let thirdViewController = AlbumsViewController()
        let thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
        thirdNavigationController.navigationBar.prefersLargeTitles = true
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        
        let fourthViewController = DefaultViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tapBarController.setViewControllers([
            firstViewController,
            secondViewController,
            thirdNavigationController,
            fourthViewController
        ], animated: true)
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        return true
    }
}
