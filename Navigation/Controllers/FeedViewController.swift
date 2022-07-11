//
//  FeedViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 29.06.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "My Post")

    private lazy var showPostButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Show Post #1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var showPostButton2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Show Post #2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.showPostButton1)
        stackView.addArrangedSubview(self.showPostButton2)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        view.addSubview(stackView)
        setupConstraints()
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
}
