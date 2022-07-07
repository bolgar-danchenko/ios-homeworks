//
//  PostViewController.swift
//  Navigation
//
//  Created by Konstantin Bolgar-Danchenko on 30.06.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Anonymous"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        self.navigationItem.title = titlePost
        
        lazy var infoButton = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(showInfo))
        
        self.navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func showInfo() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
    
}
