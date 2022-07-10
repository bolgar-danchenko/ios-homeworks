//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 29.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var newButton: UIButton = {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("New Button", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSubview()
        setupConstraints()
        
        let keyboard = UITapGestureRecognizer(target: self, action: #selector(self.typing))
        view.addGestureRecognizer(keyboard)
    }
    
    @objc private func typing() {
        view.endEditing(true)
    }

    private func setup() {
        view.backgroundColor = .lightGray
    }

    private func setupSubview() {
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            newButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            newButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
