//
//  FeedViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 29.06.2022.
//

import UIKit

class FeedViewController: UIViewController {

    open var post = Post(title: "My Post")
    
    private lazy var button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .yellow
            button.layer.cornerRadius = 15
            button.setTitle("Show Post", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupButton()
    }

    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
}
