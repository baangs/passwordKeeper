//
//  LoginViewController.swift
//  passwordKeeper
//
//  Created by RD on 2/16/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //scollview so no overlapping elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView ()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    //image for app logo
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //login passcode label
    private let loginPasscode: UILabel = {
        let loginPasscode = UILabel()
        loginPasscode.textAlignment = .center
        loginPasscode.font = .boldSystemFont(ofSize: 35)
        loginPasscode.text = "Enter Passcode"
        loginPasscode.translatesAutoresizingMaskIntoConstraints = false
        return loginPasscode
    }()
    //create password textfield
    private let registerPasscode: UITextField = {
        let registerPasscode = UITextField()
        registerPasscode.isSecureTextEntry = true
        return registerPasscode
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(loginPasscode)
        loginPasscode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginPasscode.centerYAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2, y: 100, width: size, height: size)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
}
