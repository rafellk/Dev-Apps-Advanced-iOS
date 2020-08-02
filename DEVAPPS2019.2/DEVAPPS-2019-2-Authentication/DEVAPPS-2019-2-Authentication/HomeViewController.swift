//
//  HomeViewController.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/28/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func didFinish()
}

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var callback: (() -> Void)?
    var delegate: HomeViewControllerDelegate?
    var text: String = ""
    private var privateTest = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = Singleton.shared.username
        passwordLabel.text = Singleton.shared.password
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        callback?()
        delegate?.didFinish()
        NotificationCenter.default.post(name: .didFinishNotification, object: nil)
    }

    @IBAction func signOutButtonPresed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
