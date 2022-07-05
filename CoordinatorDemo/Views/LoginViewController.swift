//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login View"
        label.backgroundColor = .white
        label.textColor = .blue
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        setupView()
    }
    
}

extension LoginViewController {
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().inset(45)
            make.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
                        
    }
    
    @objc
    private func loginAction() {
        print("loginAction")
    }
}

