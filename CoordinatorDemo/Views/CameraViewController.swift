//
//  CameraViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/4.
//

import UIKit
import SnapKit

protocol CameraViewControllerDelegate: AnyObject {
    func didClickCamera(_ vc: CameraViewController, camera: Camera)
    func printCoordinator()
    
    func goToDSLR(_ vc: CameraViewController, option: DeepLinkOption)
}

enum Camera: Int {
    case cannon = 0, nikon, sony
    
    enum type: String {
        case SLR = "Single Lens Reflex Camera"
        case DSLR = "Digital Single Lens Reflex Camera"
    }
    
    var cameraName: String {
        switch self {
        case .cannon: return "Cannon 🎥"
        case .nikon: return "Nikon 📷"
        case .sony: return "Sony 📹"
        }
    }
    
    var description: String {
        switch self {
        case .cannon: return "Canon MARK III"
        case .nikon: return "Nikon Z9"
        case .sony: return "Sony A7"
        }
    }
    
    var lens: type {
        switch self {
        case .cannon: return .DSLR
        case .nikon: return .DSLR
        case .sony: return .SLR
        }
    }
}

class CameraViewController: UIViewController {
    
    weak var delegate: CameraViewControllerDelegate?
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Camera View"
        label.backgroundColor = .white
        label.textColor = .blue
        return label
    }()
    
    lazy var canonButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(Camera.cannon.cameraName)", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 3
        button.tag = Camera.cannon.rawValue
        button.addTarget(self, action: #selector(selectCamera(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var nikonButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(Camera.nikon.cameraName)", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 3
        button.tag = Camera.nikon.rawValue
        button.addTarget(self, action: #selector(selectCamera(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var sonyButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(Camera.sony.cameraName)", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 3
        button.tag = Camera.sony.rawValue
        button.addTarget(self, action: #selector(selectCamera(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var goDSLRButton: UIButton = {
        let button = UIButton()
        button.setTitle("DSLR", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 3
        button.tag = 3
        button.addTarget(self, action: #selector(selectCamera(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        delegate?.printCoordinator()
    }
    
}

extension CameraViewController {
    private func setupView() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [canonButton, nikonButton, sonyButton, goDSLRButton])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        view.addSubview(titleLabel)
        view.addSubview(stackView)
                
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().inset(45)
            make.height.equalTo(35)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
            
    @objc
    private func selectCamera(_ sender: UIButton) {
        print("selectCamera tag: \(sender.tag)")
        
        switch sender.tag {
        case 0:
            delegate?.didClickCamera(self, camera: .cannon)
        case 1:
            delegate?.didClickCamera(self, camera: .nikon)
        case 2:
            delegate?.didClickCamera(self, camera: .sony)
        case 3:
            delegate?.goToDSLR(self, option: .canonDSLR)
        default:
            break
        }
        
    }
}
