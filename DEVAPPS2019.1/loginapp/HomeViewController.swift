//
//  HomeViewController.swift
//  loginapp
//
//  Created by Rafael Lucena on 6/20/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func didBack()
}

final class HomeViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var anyAttribute: String?
    var delegate: HomeViewControllerDelegate?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        mainLabel.text = anyAttribute
        configureButton()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.didBack()
    }

    private func configureButton() {
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true

        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }

    @objc
    private func buttonPressed() {
        UserDefaults.standard.setValue(false, forKey: "isSignedIn")
    }
}
