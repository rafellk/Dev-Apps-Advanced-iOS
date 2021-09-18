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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let missingField = validate() else {
            performSegue(withIdentifier: Segues.signedIn.rawValue, sender: self)
            return
        }
        
        presentErrorAlert(with: missingField)
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
}
