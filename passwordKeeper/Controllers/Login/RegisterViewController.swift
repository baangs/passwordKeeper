//
//  RegisterViewController.swift
//  passwordKeeper
//
//  Created by RD on 2/16/21.
//

import UIKit
import LocalAuthentication

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
        imageView.image = UIImage(named:"Lock")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //create passcode label
    private let createPasscode: UILabel = {
        let createPasscode = UILabel()
        createPasscode.textColor = .white
        createPasscode.textAlignment = .center
        createPasscode.font = .boldSystemFont(ofSize: 20)
        createPasscode.text = "Welcome to PassWordKeeper"
        createPasscode.translatesAutoresizingMaskIntoConstraints = false
        return createPasscode
    }()
    //create password button
    private let registerPasscodeButton: UIButton = {
        let passcode = UIButton()
        passcode.setTitle("Create Passocde", for: .normal)
        passcode.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return passcode
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please authorize with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {[weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let alert = UIAlertController(title: "Failed to authenticate user.", message: "Please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true, completion: nil)
                        return
                    }
                    
                    //show other screen
                    let vc = UIViewController()
                    vc.title = "Success"
                    self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil) 
                }
            }
        } else {
            let alert = UIAlertController(title: "Unavailable", message: "You cant use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.5647058824, blue: 1, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(createPasscode)
        scrollView.addSubview(registerPasscodeButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2, y: 250, width: size, height: size)
        createPasscode.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        createPasscode.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
        registerPasscodeButton.frame = CGRect(x: 30, y: createPasscode.bottom+200, width: scrollView.width-60, height: 10)
    }
}

