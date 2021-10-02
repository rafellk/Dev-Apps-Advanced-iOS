//
//  OnboardingViewController.swift
//  JewelleryApp
//
//  Created by aluno on 01/10/21.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("This shouldn't be implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
}

private extension OnboardingViewController {
    
    func configureLayout() {
        view.backgroundColor = UIColor(named: "onboarding_background")
        
        let container = UIView()
        container.backgroundColor = UIColor(named: "onboarding_card_background")
        container.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(container)
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        
        container.layer.cornerRadius = 25
        let titleLabel = UILabel()
        
        titleLabel.text = "The best jewellery in The Town Now!"
        titleLabel.numberOfLines = 0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor(named: "title_color")
        
        container.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9).isActive = true
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "We Use 100% pure Metals"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = UIColor(named: "subtitle_color")

        container.addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        let nextButtonImageView = UIImageView(image: UIImage(named: "onboarding_next_button"))
        nextButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        nextButtonImageView.contentMode = .scaleAspectFill
        
        container.addSubview(nextButtonImageView)
        nextButtonImageView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        nextButtonImageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        nextButtonImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        nextButtonImageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16).isActive = true
        nextButtonImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8).isActive = true
        
        let jewelleryImageView = UIImageView(image: UIImage(named: "jewellery_image"))
        jewelleryImageView.translatesAutoresizingMaskIntoConstraints = false
        jewelleryImageView.contentMode = .scaleAspectFit

        view.addSubview(jewelleryImageView)
        jewelleryImageView.bottomAnchor.constraint(equalTo: container.topAnchor).isActive = true
        jewelleryImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        jewelleryImageView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        jewelleryImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}