//
//  OnboardingViewController.swift
//  DeliveryApp
//
//  Created by Rafael Lucena on 9/6/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

final class OnboardingView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .background_purple
        
        configureBackgroundImage()
        configureLogoImage()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Views configuration
extension OnboardingView {

    private func configureBackgroundImage() {
        let imageView = UIImageView(image: UIImage.onboardingBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        imageView.autoPinToSuperViewEdges()
    }

    private func configureLogoImage() {
        let imageView = UIImageView(image: UIImage.logoIcon)
        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.defaultPadding),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.defaultPadding),
            imageView.heightAnchor.constraint(equalToConstant: .logoImageHeight),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
        ])
    }
}

fileprivate extension CGFloat {

    static let logoImageHeight: CGFloat = 100
}

final class OnboardingViewController: UIViewController {

    let onboardingView = OnboardingView()

    override func loadView() {
        self.view = onboardingView
    }
}

#if DEBUG
import SwiftUI

struct OnboardingViewControllerPreviews: PreviewProvider {

    static var previews: some View {
        OnboardingViewController()
    }
}

extension OnboardingViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> OnboardingViewController {
        return OnboardingViewController()
    }

    func updateUIViewController(_ uiViewController: OnboardingViewController, context: Context) {}
}

#endif
