//
//  OnboardingViewController.swift
//  Login
//
//  Created by aluno on 18/09/21.
//  Copyright © 2021 Rafael Lucena. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 4
    }
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
