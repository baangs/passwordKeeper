//
//  RegisterViewController.swift
//  passwordKeeper
//
//  Created by RD on 2/16/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    private let createPasscode: UILabel = {
        let createPasscode = UILabel()
        createPasscode.textAlignment = .center
        createPasscode.font = .boldSystemFont(ofSize: 35)
        createPasscode.text = "Create Passcode"
        createPasscode.translatesAutoresizingMaskIntoConstraints = false
        return createPasscode
    }()
    //create password textfield
    private let registerPasscode: UITextField = {
        let passcode = UITextField()
        passcode.isSecureTextEntry = true
        passcode.autocorrectionType = .no
        passcode.autocapitalizationType = .none
        passcode.keyboardType = .decimalPad
        passcode.layer.cornerRadius = 12
        passcode.layer.borderWidth = 1
        passcode.layer.borderColor = UIColor.lightGray.cgColor
        passcode.placeholder = "Passcode"
        passcode.leftViewMode = .always
        passcode.backgroundColor = .white
        passcode.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        passcode.leftViewMode = .always
        return passcode
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(createPasscode)
        scrollView.addSubview(registerPasscode)
        createPasscode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createPasscode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2, y: 250, width: size, height: size)
        registerPasscode.frame = CGRect(x: 30, y: imageView.bottom+75, width: scrollView.width-60, height: 52)
        
    }
}
