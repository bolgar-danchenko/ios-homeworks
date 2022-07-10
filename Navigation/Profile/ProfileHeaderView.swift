//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 06.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let photo = UIImage(named: "steve")
        let avatarImageView = UIImageView(image: photo)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Steve Jobs"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Stay hungry, stay foolish"
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = UIColor.gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(type: .system)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.setTitle("Change Status", for: .normal)
        setStatusButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.addTarget(self, action: #selector(changeProfileStatus), for: .editingChanged)
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private lazy var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self .setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 125),
            avatarImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 125),
            
            fullNameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 150),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            statusLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 150),
            statusLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -65),
            statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 150),
            statusTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16)
            
        ])
    }
    
    private func setupView() {
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        setupConstraints()
    }
    
    @objc private func buttonPressed() {
        let text = statusText
        statusLabel.text = text
    }
    
    @objc func changeProfileStatus(_ statusTextField: UITextField) {
        statusText = statusTextField.text ?? "Empty Status"
    }
}
