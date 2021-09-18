//
//  LoginViewController.swift
//  Login
//
//  Created by aluno on 17/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var isXIB = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        validateAndNavigateIfNeeded {
            if self.isXIB {
                // TODO: load specific storyboard view controller
            } else {
                self.performSegue(withIdentifier: Segues.signedIn.rawValue, sender: self)
            }
        }
    }
    
    @IBAction func signInWithXIBButtonPressed(_ sender: Any) {
        validateAndNavigateIfNeeded {
            let viewController = HomeViewController(nibName: "HomeXIBViewController", bundle: nil)
            viewController.username = self.usernameTextField.text
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.signedIn.rawValue {
            let destinationController = segue.destination as? HomeViewController
            destinationController?.username = usernameTextField.text
        }
    }
}

// MARK: Private methods extension

private extension LoginViewController {
    
    func presentErrorAlert(with missingField: String) {
        let alert = UIAlertController(title: "Error", message: "\(missingField) is required", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func handleSignedOutEvent() {
        usernameTextField.text = nil
        passwordTextField.text = nil
        let alert = UIAlertController(title: "Signed Out", message: "You are signed out", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func validate() -> String? {
        if usernameTextField.text?.isEmpty == true {
            return "Username"
        }
        
        if passwordTextField.text?.isEmpty == true {
            return "Password"
        }
        
        return nil
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(signedOutReceived),
                                               name: NSNotification.Name("signedOut"),
                                               object: nil)
    }
    
    @objc
    func signedOutReceived() {
        handleSignedOutEvent()
    }
    
    func validateAndNavigateIfNeeded(navigationCallback: @escaping () -> Void) {
        guard let missingField = validate() else {
            navigationCallback()
            return
        }
        
        presentErrorAlert(with: missingField)
    }
}
