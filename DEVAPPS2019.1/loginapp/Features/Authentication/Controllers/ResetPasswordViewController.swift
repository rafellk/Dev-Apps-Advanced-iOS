//
//  ResetPasswordViewController.swift
//  loginapp
//
//  Created by Rafael Lucena on 6/20/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    private func configureButton() {
        resetButton.layer.cornerRadius = 4
    }
}
