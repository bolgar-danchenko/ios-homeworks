//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 29.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        
        let keyboard = UITapGestureRecognizer(target: self, action: #selector(self.typing))
        view.addGestureRecognizer(keyboard)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
    
    @objc private func typing() {
        view.endEditing(true)
    }
}

