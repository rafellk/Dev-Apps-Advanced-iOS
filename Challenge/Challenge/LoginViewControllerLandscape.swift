//
//  LoginViewController.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/22/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit

class LoginViewControllerLandscape: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!

    var onboardingViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadOnboarding(withModels: [
            OnboardingCollectionViewCellModel(title: "The best app ever from login", description: "First app with the new guys", imageName: "background"),
            OnboardingCollectionViewCellModel(title: "The best app ever from login", description: "First app with the new guys", imageName: "background")
        ])

        configureButton()
        configureNavigationItem()
//        configureLogo()
    }

    private func loadOnboarding(withModels models: [OnboardingCollectionViewCellModel]) {
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            onboardingViewController = viewController
            viewController.datasource = models
            present(viewController, animated: true, completion: nil)
        }

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureLogo()
    }

    private func configureButton() {
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = true
    }

    private func configureNavigationItem() {
        navigationItem.title = "Login"
    }

    private func configureLogo() {
        logoImageView.image = UIImage(named: "background")
        logoImageView.layer.cornerRadius = logoImageView.bounds.height / 2
        logoImageView.layer.masksToBounds = true
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        if newCollection.verticalSizeClass == .regular {
            dismiss(animated: true, completion: nil)

            let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
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
