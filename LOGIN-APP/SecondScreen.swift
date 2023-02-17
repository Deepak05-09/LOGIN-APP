//
//  SecondScreen.swift
//  LOGIN-APP
//
//  Created by sysadmin on 16/02/23.
//

import UIKit

class SecondScreen: UIViewController {
    
    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let t1 = UINavigationController(rootViewController: HomeController())
        let t2 = UINavigationController(rootViewController:MyAccountController())
        let t3 = UINavigationController(rootViewController:SettingController())
        let t4 = UINavigationController(rootViewController:HelpController())
        
        t1.title = "Home"
        t2.title = "My Account"
        t3.title = "Settings"
        t4.title = "Help"
        
        t1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        t1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
//        for item in tabBar.tabBar.items{
//            item.
//        }
        tabBar.setViewControllers([t1,t2,t3,t4], animated: false)
        tabBar.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(tabBar, animated: false)
    }
    
    


}


class HomeController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
   
}

class HelpController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
    }
}

class SettingController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }
}

class MyAccountController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
    }
}
