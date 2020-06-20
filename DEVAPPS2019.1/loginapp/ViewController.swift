//
//  ViewController.swift
//  loginapp
//
//  Created by Rafael Lucena on 6/19/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .primaryActionTriggered)
    }

    @objc
    private func signInButtonPressed() {
        // Load using XIB
//        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//        homeViewController.anyAttribute = "Teste"
//        homeViewController.delegate = self
//        navigationController?.pushViewController(homeViewController, animated: true)

        updateUserDefaults()

        // Load using storyboard
        guard let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? HomeViewController else {
            return
        }

        homeViewController.anyAttribute = "Teste"
        homeViewController.delegate = self
        navigationController?.pushViewController(homeViewController, animated: true)
    }

    private func updateUserDefaults() {
        UserDefaults.standard.setValue(true, forKey: "isSignedIn")
    }
}

extension ViewController: HomeViewControllerDelegate {

    func didBack() {
        let alertController = UIAlertController(title: "Back", message: "You did back successfully!!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
