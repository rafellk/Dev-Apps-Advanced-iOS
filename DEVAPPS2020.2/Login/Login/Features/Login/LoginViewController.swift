//
//  LoginViewController.swift
//  Login
//
//  Created by aluno on 17/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

// usernameTextField -> align X, align Y - 32, equalsWidth * 0.65
// passwordTextField -> align X, vertical spacing usernameTextField 16, equalsWidth * 1
// sign in with XIB button -> align X, vertical spacing passwordTextField 32, equalsWidth * 1
// sign in button -> align X, vertical spacing sign in with XIB button 16, equalsWidth * 1


final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var isXIB = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if !UserDefaults.standard.bool(forKey: "has_presented_onboarding") {
//            UserDefaults.standard.setValue(true, forKey: "has_presented_onboarding")
            guard let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() else { return }
            present(viewController, animated: true, completion: nil)
//        }
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
