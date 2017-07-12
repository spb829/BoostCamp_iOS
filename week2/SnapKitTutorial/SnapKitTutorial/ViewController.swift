//
//  ViewController.swift
//  SnapKitTutorial
//
//  Created by Sohn on 12/07/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var mainLogoImageView: UIImageView = UIImageView()
    var idTextField: UITextField = UITextField()
    var pwTextField: UITextField = UITextField()
    var signInButton: UIButton = UIButton()
    var signUpButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = UITextField()
        textField.delegate
        initViews()
    }
    
    private func initViews() -> Void {
        mainLogoImageView.contentMode = .scaleAspectFit
        mainLogoImageView.image = UIImage(named: "Terry")
        
        self.view.addSubview(mainLogoImageView)
        
        mainLogoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(120)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        idTextField.placeholder = "ID"
        idTextField.borderStyle = .roundedRect
        self.view.addSubview(idTextField)
        
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(mainLogoImageView.snp.bottom).offset(48)
            make.centerX.equalTo(self.view)
            make.leading.equalTo(self.view).offset(64)
            make.height.equalTo(30)
        }
        
        pwTextField.placeholder = "Password"
        pwTextField.borderStyle = .roundedRect
        self.view.addSubview(pwTextField)
        
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(12)
            make.centerX.equalTo(self.view)
            make.leading.equalTo(self.view).offset(64)
            make.height.equalTo(30)
        }
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(24)
            make.centerX.equalTo(self.view).offset(-64)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(24)
            make.centerX.equalTo(self.view).offset(64)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }

}

