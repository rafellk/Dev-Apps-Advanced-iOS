//
//  AppCoordinator.swift
//  Login
//
//  Created by aluno on 01/10/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

struct AppCoordinator {
    
    static func start() -> UIViewController {
        if let username = UserDefaults.standard.string(forKey: "signed_in_user") {
            let viewController = HomeViewController(nibName: "HomeXIBViewController", bundle: nil)
            viewController.username = username
            return viewController
        } else {
            let viewController = LoginViewController(nibName: "LoginXIBViewController", bundle: nil)
            viewController.isXIB = true
            return viewController
        }
    }
}
