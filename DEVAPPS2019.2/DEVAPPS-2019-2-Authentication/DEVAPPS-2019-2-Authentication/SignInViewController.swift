//
//  SignInViewController.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/28/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        configureImageView()
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.horizontalSizeClass == .compact {
            dismiss(animated: true)
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
//        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//        viewController.callback = { [weak self] in
//            self?.presentAlertController()
//        }

        Singleton.shared.username = "Rafael Lucena"
        Singleton.shared.password = "rlmg1234"
        Singleton.shared.todoList.append(textField.text)

//        viewController.delegate = self

        guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() else {
            return
        }

//        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "homeID")

        navigationController?.pushViewController(viewController, animated: true)
    }

    private func configureImageView() {
        guard let imageView = imageView else {
            return
        }

        imageView.layer.cornerRadius = imageView.frame.size.height / 2
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
