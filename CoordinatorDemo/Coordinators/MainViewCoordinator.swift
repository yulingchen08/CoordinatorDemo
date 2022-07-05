//
//  MainViewCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/4.
//

import UIKit

class MainViewCoordinator: UINavigationController {
    public init() {
        let rootVC = MainViewController()
        super.init(rootViewController: rootVC)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

