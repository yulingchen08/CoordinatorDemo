//
//  CameraDetailViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/5.
//

import UIKit
import SnapKit

protocol CameraDetailDelegate: AnyObject {
    func didClickLength(_ vc: CameraDetailViewController, camera: Camera)
}

class CameraDetailViewController: UIViewController {
    
    let camera: Camera
    weak var delegate: CameraDetailDelegate?
    
    private lazy var cameraNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .blue
        label.text = camera.cameraName
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cameraDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .blue
        label.text = camera.description
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lensButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(clickLens), for: .touchUpInside)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "camera.viewfinder"), for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    init(camera: Camera) {
        self.camera = camera
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


extension CameraDetailViewController {
    private func setup() {
        view.backgroundColor = .red
        let stackView = UIStackView(arrangedSubviews: [cameraNameLabel, cameraDescriptionLabel, lensButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
    }
    
    @objc
    private func clickLens() {
        delegate?.didClickLength(self, camera: camera)
    }
}
