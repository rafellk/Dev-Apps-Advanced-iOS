//
//  SignInViewController.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/28/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        viewController.callback = { [weak self] in
            self?.presentAlertController()
        }
//        viewController.delegate = self

//        guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() else {
//            return
//        }

//        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "homeID")

        navigationController?.pushViewController(viewController, animated: true)
    }

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification), name: .didFinishNotification, object: nil)
    }

    @objc
    private func onNotification() {
        presentAlertController()
    }

    private func presentAlertController() {
        let alert = UIAlertController(title: "Warning", message: "User is signed out", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(defaultAction)
        present(alert, animated: true)
    }

}

extension SignInViewController: HomeViewControllerDelegate {

    func didFinish() {
        presentAlertController()
    }
}

extension Notification.Name {
    static let didFinishNotification = Notification.Name(rawValue: "didFinishNotification")
}
