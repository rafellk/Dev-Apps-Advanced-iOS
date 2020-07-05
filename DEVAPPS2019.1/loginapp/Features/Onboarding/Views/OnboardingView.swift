//
//  OnboardingView.swift
//  loginapp
//
//  Created by Rafael Lucena on 7/4/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import UIKit

final class OnboardingView: UIView {

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "logoColor")
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Log in to your account"
        return label
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "logoColor")
        button.layer.cornerRadius = 4
        return button
    }()

    private lazy var termsAndConditionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primaryColor")
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Terms & Conditions"
        label.textAlignment = .center
        return label
    }()

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.currentPageIndicatorTintColor = UIColor(named: "logoColor")
        page.pageIndicatorTintColor = UIColor(named: "primaryColor")
        return page
    }()

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "defaultBackgroundColor")

        configureLoginLabel()
        configureBottomStack()
        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Constraints extension
private extension OnboardingView {

    func configureLoginLabel() {
        addSubview(loginLabel)
        loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
    }

    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: -45).isActive = true
    }

    func configureBottomStack() {
        addSubview(bottomStack)
        bottomStack.addArrangedSubview(pageControl)
        bottomStack.addArrangedSubview(loginButton)
        bottomStack.addArrangedSubview(termsAndConditionsLabel)

        bottomStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        bottomStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true

        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
