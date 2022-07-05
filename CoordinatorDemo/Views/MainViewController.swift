//
//  MainViewController.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {
    
    private let cameraCoordinator: CameraCoordinator = .init()
    private let notificationCoordinator: NotificationCoordinator = .init()
    private let settingsCoordinator: SettingsCoordinator = .init()
    
//    private var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Main View"
//        label.backgroundColor = .white
//        label.textColor = .blue
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewControllers()
        setTabBarItems()
    }
}

extension MainViewController {
    enum TabType {
        case cameras
        case notification
        case settings
    }
    
//    func selectTo(tab: TabType) {
//        var navi: UINavigationController
//        switch tab {
//        case .home:
//            navi = homeCoordinator.navigater
//        case .cameras:
//            navi = cameraCoordinator.navigater
//        case .search:
//            navi = searchCoordinator.navigater
//        case .notifications:
//            navi = notificationCoordinator.navigater
//        case .more:
//            navi = moreCoordinator.navigater
//        }
//
//        if let selectedIndex = viewControllers?.firstIndex(of: navi) {
//            self.selectedIndex = selectedIndex
//        }
//    }
}

extension MainViewController {
    private func setupView() {
//        view.addSubview(titleLabel)
//
//        titleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().multipliedBy(0.5)
//            make.width.equalToSuperview().inset(45)
//            make.height.equalTo(35)
//        }
        
    }
    
    private func setupViewControllers() {
        viewControllers = [
            cameraCoordinator.navigater,
            notificationCoordinator.navigater,
            settingsCoordinator.navigater
        ]
    }
    
    private func setTabBarItems() {
        let items: [UITabBarItem] = [
            .init(title: "Camera",
                  image: UIImage(systemName: "plus.square"),
                  selectedImage: UIImage(systemName: "plus.square")),
            .init(title: "Notification",
                  image: UIImage(systemName: "plus.square"),
                  selectedImage: UIImage(systemName: "plus.square")),
            .init(title: "Settings",
                  image: UIImage(systemName: "plus.square"),
                  selectedImage: UIImage(systemName: "plus.square")),
        ]

        for (index, item) in items.enumerated() {
            tabBar.items?[index].title = item.title
            tabBar.items?[index].image = item.image
            tabBar.items?[index].selectedImage = item.selectedImage
        }

        tabBar.barTintColor = .blue
        tabBar.unselectedItemTintColor = .brown
        tabBar.tintColor = .darkGray
    }
}
