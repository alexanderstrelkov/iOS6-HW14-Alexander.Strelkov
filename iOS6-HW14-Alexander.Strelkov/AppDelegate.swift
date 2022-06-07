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
        
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName:
"photo.on.rectangle"), tag: 0)
        
        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), tag: 1)

        let thirdViewController = ThirdViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)

        let fourthViewController = FourthViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tapBarController.setViewControllers([
            firstViewController,
            secondViewController,
            thirdViewController,
            fourthViewController
        ], animated: true)
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}
