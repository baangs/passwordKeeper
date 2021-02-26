//
//  WebViewController.swift
//  passwordKeeper
//
//  Created by RD on 2/23/21.
//

import UIKit

class WebViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("web", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        button.center = view.center
    }
    
    @objc private func didTapButton(){
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        let vc = ActualWebViewController(url: url, title: "Google")
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
}
