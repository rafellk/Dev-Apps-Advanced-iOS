//
//  OnboardingViewController.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/22/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    var onClose: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    private func configureButton() {
        closeButton.layer.cornerRadius = 3
        closeButton.layer.masksToBounds = true
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        onClose?()
        dismiss(animated: true, completion: nil)
    }
}
