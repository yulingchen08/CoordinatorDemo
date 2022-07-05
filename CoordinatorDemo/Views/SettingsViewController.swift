//
//  SettingsViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/4.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings View"
        label.backgroundColor = .white
        label.textColor = .blue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
}

extension SettingsViewController {
    private func setupView() {
        view.addSubview(titleLabel)
        
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().inset(45)
            make.height.equalTo(35)
        }
                        
    }
}
