//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Aysa Minkova on 2021/08/12.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(avatarImage)
        addSubview(stackViewNameStatus)
        addSubview(setStatusButton)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(avatarImage)
        addSubview(stackViewNameStatus)
        addSubview(setStatusButton)
        setupView()
    }

    
    lazy var stackViewNameStatus: UIStackView = {
        let stackViewNameStatus = UIStackView(arrangedSubviews: [fullNameLabel, statusLabel, statusTextField])
        stackViewNameStatus.axis = .vertical
        stackViewNameStatus.translatesAutoresizingMaskIntoConstraints = false
        return stackViewNameStatus
    }()

    
    var avatarImage: UIImageView = {
        let avatarImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        avatarImage.image = UIImage(named: "roxy")
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
       return avatarImage
     }()
    
    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Badass cat"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = UIColor.gray
        statusLabel.text = "Waiting for something"
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.cornerRadius = 14
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusTextField.placeholder = "Set your status"
        statusTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 40))
        statusTextField.leftViewMode = .always
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Set status", for: .normal)
        
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    override func layoutSubviews() {
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }
    
    private func setupView() {
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.layer.masksToBounds = true
        self.backgroundColor = .systemGray6
        [
        avatarImage.widthAnchor.constraint(equalToConstant: 120),
        avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
        avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        avatarImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
        statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
        statusTextField.heightAnchor.constraint(equalToConstant: 40),
        statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

        
        stackViewNameStatus.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
        stackViewNameStatus.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        stackViewNameStatus.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -30   ),
            
        setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        setStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 50),
        setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        setStatusButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
    ].forEach{($0.isActive = true)
    }
}
    @objc func buttonPressed() {
        if let text = statusText {
            statusLabel.text = text
        } else {
            statusLabel.text = "Waiting for something"
        }
        statusTextField.resignFirstResponder()
    }
    
    private var statusText: String?
    
    @objc func statusTextChanged() {
        if let userInput = statusTextField.text {
            statusText = userInput
        }
        
    }
    
}



