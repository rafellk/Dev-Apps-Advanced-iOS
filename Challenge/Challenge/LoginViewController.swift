//
//  LoginViewController.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/22/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            viewController.onClose = {
                DispatchQueue.main.async {
                    self.showAlert()
                }
            }
            present(viewController, animated: true, completion: nil)            
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let button = UIBarButtonItem(title: "Log out", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = button
        
        let viewController = LoggedViewController(nibName: "LoggedViewController", bundle: nil)
        viewController.on😁Closed = { [weak self] result in
            self?.showAlert()
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "You are signed out", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
