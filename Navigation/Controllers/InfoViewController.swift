//
//  InfoViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 30.06.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var showAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        view.addSubview(showAlertButton)
        setupConstraints()
    }

    @objc private func tap() {
        let vc = UIAlertController(title: "Hello", message: "Do you like my homework?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in
            NSLog("All right")
        }
        let cancelAction = UIAlertAction(title: "Not quite", style: .default) {
            UIAlertAction in
            NSLog("Needs to be improved")
        }
        vc.addAction(cancelAction)
        vc.addAction(okAction)
        present(vc, animated: true)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            showAlertButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            showAlertButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            showAlertButton.widthAnchor.constraint(equalToConstant: 100),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
