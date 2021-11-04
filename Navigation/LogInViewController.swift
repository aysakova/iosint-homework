//
//  LogInViewController.swift
//  Navigation
//
//  Created by Aysa Minkova on 2021/08/17.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 50))
        textField.leftViewMode = .always
        textField.placeholder = "Email or phone"
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 50))
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private var logInButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        
        if button.state != .normal { button.alpha = 0.8 }
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.navigationBar.isHidden = true
    }

    @objc func buttonPressed() {
        let profileVC = ProfileVIewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyBoardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
            scrollView.contentInset.bottom = .zero
            scrollView.verticalScrollIndicatorInsets.bottom = .zero
    }
    
    // MARK: Constraints
    private func setupViews() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(logoImageView)
        containerView.addSubview(loginTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(logInButton)
        
        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: self.tabBarController!.tabBar.frame.height, right: 0)
        self.scrollView.contentInset = adjustForTabbarInsets
        self.scrollView.scrollIndicatorInsets = adjustForTabbarInsets
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),

            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -400)
        
        ])
    }
}
