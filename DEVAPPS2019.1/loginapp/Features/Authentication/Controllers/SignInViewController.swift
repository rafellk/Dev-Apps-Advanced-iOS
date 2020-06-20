//
//  SignInViewController.swift
//  loginapp
//
//  Created by Rafael Lucena on 6/20/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureButton()
    }
}

// MARK: Configuration methods
extension SignInViewController {

    private func configureButton() {
        signInButton.layer.cornerRadius = 4
    }

    private func configureNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
