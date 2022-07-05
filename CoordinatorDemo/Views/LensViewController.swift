//
//  LensViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/5.
//

import UIKit

class LensViewController: UIViewController {
    
    let camera: Camera
    
    private lazy var lensLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .blue
        label.text = camera.lens.rawValue
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        setup()
    }
    
    init(camera: Camera) {
        self.camera = camera
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LensViewController {
    func setup() {
        view.backgroundColor = .green
        view.addSubview(lensLabel)
        
        lensLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(35)
        }
    }
}
