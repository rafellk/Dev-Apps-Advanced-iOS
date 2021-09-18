//
//  HomeViewController.swift
//  Login
//
//  Created by aluno on 17/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = username else { return }
        welcomeLabel.text = "Welcome \(username)"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(signOutButtonPressed))
        UserDefaults.standard.setValue(username, forKey: "signed_in_user")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(Notification(name: Notification.Name("signedOut")))
    }
}

private extension HomeViewController {
    
    @objc
    func signOutButtonPressed() {
        UserDefaults.standard.setValue(nil, forKey: "signed_in_user")
        if navigationController?.viewControllers.count ?? 0 > 1 {
            navigationController?.popViewController(animated: true)
        } else {
            let viewController = LoginViewController(nibName: "LoginXIBViewController", bundle: nil)
            viewController.isXIB = true
            viewController.navigationItem.hidesBackButton = true
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
