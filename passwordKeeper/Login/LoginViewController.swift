//
//  LoginViewController.swift
//  passwordKeeper
//
//  Created by RD on 2/16/21.
//

import UIKit

import UIKit

class LoginViewController: UIViewController {
    
    //scollview so no overlapping elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView ()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    //logo image
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //create passcode label
    private let enterPasscode: UILabel = {
        let enterPasscode = UILabel()
        enterPasscode.textAlignment = .center
        enterPasscode.font = .boldSystemFont(ofSize: 15)
        enterPasscode.text = "Enter Passcode"
        enterPasscode.translatesAutoresizingMaskIntoConstraints = false
        return enterPasscode
    }()
    //create password textfield
    private let inputPasscode: UITextField = {
        let loginPasscode = UITextField()
        loginPasscode.isSecureTextEntry = true
        loginPasscode.autocorrectionType = .no
        loginPasscode.autocapitalizationType = .none
        loginPasscode.keyboardType = .decimalPad
        loginPasscode.layer.cornerRadius = 12
        loginPasscode.layer.borderWidth = 1
        loginPasscode.layer.borderColor = UIColor.lightGray.cgColor
        loginPasscode.placeholder = "Passcode"
        loginPasscode.leftViewMode = .always
        loginPasscode.backgroundColor = .white
        loginPasscode.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        loginPasscode.leftViewMode = .always
        return loginPasscode
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(enterPasscode)
        scrollView.addSubview(inputPasscode)
        enterPasscode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterPasscode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2, y: 250, width: size, height: size)
        inputPasscode.frame = CGRect(x: 30, y: imageView.bottom+75, width: scrollView.width-60, height: 52)
        
    }
}
