//
//  SignInViewController.swift
//  loginapp
//
//  Created by Rafael Lucena on 6/20/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    private var containerViewLeadingConstraint: NSLayoutConstraint?
    private var containerViewWidthConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
        configureHorizontalPadding()
    }

//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        guard newCollection.verticalSizeClass == .regular else {
//            containerViewLeadingConstraint?.isActive = false
//            configureWidthConstraint()
//            return
//        }
//
//        containerViewLeadingConstraint?.isActive = true
//        containerViewWidthConstraint?.isActive = false
//    }
}

// MARK: Configuration methods
extension SignInViewController {

    private func configureButton() {
        signInButton.layer.cornerRadius = 4
    }

    private func configureHorizontalPadding() {
        containerViewLeadingConstraint = containerView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 8)
        containerViewLeadingConstraint?.isActive = true
    }

    private func configureWidthConstraint() {
        if containerViewWidthConstraint == nil {
            containerViewWidthConstraint = containerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5)
        }

        containerViewWidthConstraint?.isActive = true
    }
}
