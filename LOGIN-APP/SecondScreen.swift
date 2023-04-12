//
//  SecondScreen.swift
//  LOGIN-APP
//
//  Created by sysadmin on 16/02/23.
//

import UIKit

class SecondScreen: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setupTabBar()
    }
    
    func setupTabBar(){
        
//        navigationItem
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

class AccountController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }
    
}
